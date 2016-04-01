import path from 'path';

const jsPath = './resources/assets/js';

export default {
    entry: {
        login: `${jsPath}/login/login`,
        leftmenu: `${jsPath}/leftmenu`,
        menumap: `${jsPath}/menumap`,
        crumbs: `${jsPath}/crumbs`
    },
    module: {
        loaders: [
            {
                test: /\.jsx?$/,
                exclude: /(node_modules|bower_components)/,
                loader: 'babel'
            }
        ]
    },
    output: {
        path: path.join(__dirname, "./public/js"),
        filename: "[name].js"
    }
};