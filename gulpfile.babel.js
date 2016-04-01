import elixir from 'laravel-elixir';
import gulp from 'gulp';
import wiredep from 'wiredep';
import webpack from 'laravel-elixir-webpack';
import _ from 'lodash';
import webpackConfig from './webpack.config.babel.js';
import mapList from './map.json';

let wireDep = wiredep.stream;

let wireDepOpts = {
    ignorePath: /(\..\/)*(public)?/,
    fileTypes: {
        php: {
            block: /(([ \t]*)<!--\s*bower:*(\S*)\s*-->)(\n|\r|.)*?(<!--\s*endbower\s*-->)/gi,
            detect: {
                js: /<script.*src=['"]([^'"]+)/gi,
                css: /<link.*href=['"]([^'"]+)/gi
            },
            replace: {
                js: '<script src="{{filePath}}"></script>',
                css: '<link rel="stylesheet" href="{{filePath}}" />'
            }
        }
    }
};

let saveTaskList = ((mapList) => {

    let sourceViewsPath = './resources/views';
    let taskList = [];

    _.forEach(mapList, (val, key)=>{

        let taskName = `save_${key}`;
        taskList.push(taskName);

        gulp.task(taskName, ()=>{

            let opts = null;

            if(!_.isEmpty(val.dependencies)){
                opts = _.cloneDeep(wireDepOpts);
                opts.bowerJson = val;
            }

            gulp.src(`${sourceViewsPath}/${val.path}`)
                .pipe(wireDep(opts || wireDepOpts))
                .pipe(gulp.dest(val.releaseTo));
        });
    });
    return taskList;
})(mapList);

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Less
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir((mix) => {
    mix.less('app.less').version('css/app.css');
    mix.webpack(['login/login.js'],webpackConfig);
});

gulp.task('save', saveTaskList);

