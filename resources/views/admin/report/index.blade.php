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
                          <select class="form-control" name="agency_id" id="agency_id">
                          </select>
                      </div>

                      <div class="form-group input-group-sm f-g">
                          <label for="search-realname">热点选择</label>
                          <select class="form-control" name="hotspot_id" id="hotspot_id">
                          </select>
                      </div>

                      <div class="form-group input-group-sm f-g">
                          <label for="search-time">日期选择</label>
                          <input type="text" value="<?php if(isset($data['timeFrom'])) echo $data['timeFrom']; ?>" name="time_from" id="search-time" class="form-control">
                          到
                          <input type="text" value="<?php if(isset($data['timeTo'])) echo $data['timeTo']; ?>" name="time_to" id="search-time-to" class="form-control">
                      </div>

                      <div class="form-group btn-group-sm f-g">
                          <input class="btn btn-primary" type="submit" value="查 询">
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
                              <td><?php echo $value['agency']['name']; ?></td>
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
            format: "yyyy-mm-dd",
            minView: "month",
            weekStart: 1,
            todayBtn:  1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0
        });

        $('#search-time-to').datetimepicker({
            language:  'zh-CN',
            format: "yyyy-mm-dd",
            minView: "month",
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
        var agencyData = JSON.parse('<?php echo $agencyData; ?>');
        var lineData = JSON.parse('<?php echo $lineData; ?>');
        var pieData = JSON.parse('<?php echo $pieData; ?>');
        var pie  = new Chart(document.getElementById("chart1").getContext("2d")).Doughnut(pieData);
        var line = new Chart(document.getElementById("chart2").getContext("2d")).Line(lineData);

        $(document).ready(function(){
            $('#agency_id').change(function(){
                var substr = '<option value="0">全部</option>';
                var id = $(this).find("option:selected").val();
                $.each(agencyData, function(key, value){
                    if (value.id == id) {
                        $.each(value.hotspots, function(k, v){
                            substr += '<option value="' + v.id + '">' + v.name + '</option>';
                        });
                    }
                });
                $('#hotspot_id').html(substr);
            });

            //初始化级连下拉
            var str = '<option value="0">全部</option>';
            $.each(agencyData, function(key, value){
                str+= '<option value="'+value.id+'">'+value.name+'</option>';
            });
            $('#agency_id').html(str);

            <?php if(isset($data['agency_id'])):?>
            $('#agency_id').val({{$data['agency_id']}}).trigger('change');
            <?php endif;?>
            <?php if(isset($data['hotspot_id'])):?>
            $('#hotspot_id').val({{$data['hotspot_id']}});
            <?php endif;?>
        });

    </script>

<?php echo widget('Admin.Common')->htmlend(); ?>