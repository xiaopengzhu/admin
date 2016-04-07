<?php echo widget('Admin.Common')->header(); ?>
    <?php echo widget('Admin.Common')->top(); ?>
    <?php echo widget('Admin.Menu')->leftMenu(); ?>
    <div class="content">
        <?php echo widget('Admin.Menu')->contentMenu(); ?>
        <?php echo widget('Admin.Common')->crumbs('Agency'); ?>
        <div class="main-content">
          <div id="sys-list">
          <div class="row">
              <div class=" col-md-12">
                  <div class="panel panel-default">
                    <div class="table-responsive">
                      <table class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th>机构名</th>
                            <th>机构类型</th>
                            <th>归属机构</th>
                            <th>状态</th>
                            <th>操作</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php foreach($agencylist as $key => $value): ?>
                            <tr>
                              <td><?php echo $value['name']; ?></td>
                              <td><?php if($value['type'] == 1) echo '学校'; elseif($value['type'] == 2) echo '省厅';?></td>
                              <td><?php echo $value['parent']['name'];?></td>
                              <td><?php echo $value['status'] == 1 ? '<i class="fa fa-check" style="color:green;"></i>' : '<i class="fa fa-times" style="color:red;"></i>'; ?></td>
                              <td>
                                <?php echo widget('Admin.Agency')->edit($value); ?>
                                <?php echo widget('Admin.Agency')->delete($value); ?>
                                <?php if($value['type'] == 1) echo widget('Admin.Agency')->addHotspot($value); ?>
                              </td>
                            </tr>
                          <?php endforeach; ?>
                        </tbody>
                      </table>
                      </div>
                  </div>
              </div>
          </div>
          <?php echo $page; ?>
          </div>
          <?php echo widget('Admin.Common')->footer(); ?>
        </div>
    </div>
<?php echo widget('Admin.Common')->htmlend(); ?>