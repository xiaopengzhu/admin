<?php echo widget('Admin.Common')->header(); ?>
    <?php echo widget('Admin.Common')->top(); ?>
    <?php echo widget('Admin.Menu')->leftMenu(); ?>
    <div class="content">
        <?php echo widget('Admin.Common')->crumbs(); ?>
        <div class="main-content">
          <div class="row">
              <div class=" col-md-12">
                  <div class="panel panel-default">
                      <a href="#widget1container" class="panel-heading" data-toggle="collapse">首页 </a>
                      <div id="widget1container" class="panel-body collapse in">
                          欢迎光临
                      </div>
                  </div>
              </div>
          </div>
        <?php echo widget('Admin.Common')->footer(); ?>
            
        </div>
    </div>
<?php echo widget('Admin.Common')->htmlend(); ?>