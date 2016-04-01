<?php echo widget('Admin.Common')->header(); ?>
    <?php echo widget('Admin.Common')->top(); ?>
    <?php echo widget('Admin.Menu')->leftMenu(); ?>
    <div class="content">
        <?php echo widget('Admin.Menu')->contentMenu(); ?>
        <?php echo widget('Admin.Common')->crumbs(); ?>
        <div class="main-content">
          <div id="sys-list">
          <div class="row">
              <div class="col-md-12">
                  <form method="get" action="" class="form-inline">
                      <div class="form-group input-group-sm f-g">
                          <label for="search-username">学校选择</label>
                          <select class="form-control" name="school_id">
                              <option value="">请选择</option>
                              <?php foreach($school_list as $item) :?>
                              <option value="{{$item->id}}" <?php if(isset($data['school_id']) && $data['school_id'] == $item->id):?>selected<?php endif;?>>{{$item->name}}</option>
                              <?php endforeach;?>
                          </select>
                      </div>

                      <div class="form-group input-group-sm f-g">
                          <label for="search-realname">热点选择</label>
                          <select class="form-control" name="hotspot_id">
                              <option value="">请选择</option>
                              <?php foreach($hotspot_list as $item) :?>
                              <option value="{{$item->id}}" <?php if(isset($data['hotspot_id']) && $data['hotspot_id'] == $item->id):?>selected<?php endif;?>>{{$item->name}}</option>
                              <?php endforeach;?>
                          </select>
                      </div>

                      <div class="form-group input-group-sm f-g">
                          <label for="search-time">登录时间</label>
                          <input type="text" value="<?php if(isset($data['timeFrom'])) echo $data['timeFrom']; ?>" name="time_from" id="search-time" class="form-control">
                          到
                          <input type="text" value="<?php if(isset($data['timeTo'])) echo $data['timeTo']; ?>" name="time_to" id="search-time-to" class="form-control">
                      </div>

                      <div class="form-group btn-group-sm f-g">
                          <input class="btn btn-primary" type="submit" value="查询日志">
                      </div>
                  </form>
              </div>
              <div style="margin-bottom:5px; clear:both;"></div>
              <div class=" col-md-12">
                  <canvas id="chart1" width="300" height="150"></canvas>
                  <canvas id="chart2" width="900" height="150"></canvas>
              </div>
              <div style="margin-bottom:15px; clear:both;"></div>
              <div class=" col-md-12">
                  <div class="panel panel-default">
                    <div class="table-responsive">
                      <table class="table table-bordered table-striped">
                        <thead>
                          <tr>
                            <th>ID</th>
                            <th>热点名</th>
                            <th>归属学校</th>
                            <th>登录类型</th>
                            <th>用户ID</th>
                            <th>用户名</th>
                            <th>登录时间</th>
                            <th>登录状态</th>
                            <th>描述</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php foreach($list as $key => $value): ?>
                            <tr>
                              <td><?php echo $value['id']; ?></td>
                              <td><?php echo $value['hotspot']['name']; ?></td>
                              <td><?php echo $value['school']['name']; ?></td>
                              <td><?php if($value['type']==1) echo 'IOS'; elseif($value['type']==2) echo 'Android'; else echo 'WEB'; ?></td>
                              <td><?php echo $value['ybuser_id']; ?></td>
                              <td><?php echo $value['ybuser_name']; ?></td>
                              <td><?php echo date('Y-m-d H:i:s', $value['login_time']); ?></td>

                              <td><?php echo $value['status'] == 1 ? '<i class="fa fa-check" style="color:green;"></i>' : '<i class="fa fa-times" style="color:red;"></i>'; ?></td>
                              <td><?php echo $value['desc']; ?></td>
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
    <!-- js css -->
    <link rel="stylesheet" type="text/css" href="<?php echo loadStatic('/lib/datepicker/bootstrap-datetimepicker.min.css'); ?>">
    <script src="<?php echo loadStatic('/lib/datepicker/bootstrap-datetimepicker.min.js'); ?>" type="text/javascript"></script>
    <script src="<?php echo loadStatic('/lib/datepicker/locales/bootstrap-datetimepicker.zh-CN.js'); ?>" type="text/javascript"></script>
    <script type="text/javascript">
        $('#search-time').datetimepicker({
            language:  'zh-CN',
            format: "yyyy-mm-dd hh:ii:ss",
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0
        });

        $('#search-time-to').datetimepicker({
            language:  'zh-CN',
            format: "yyyy-mm-dd hh:ii:ss",
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0
        });
    </script>
    <script src="<?php echo loadStatic('/lib/chartjs/Chart.min.js'); ?>" type="text/javascript"></script>
    <script>
        var lineData = JSON.parse('<?php echo $lineData; ?>');
        var pieData = JSON.parse('<?php echo $pieData; ?>');
        var pie  = new Chart(document.getElementById("chart1").getContext("2d")).Doughnut(pieData);
        var line = new Chart(document.getElementById("chart2").getContext("2d")).Line(lineData);
    </script>

<?php echo widget('Admin.Common')->htmlend(); ?>