<?php echo widget('Admin.Common')->header(); ?>
    <?php echo widget('Admin.Common')->top(); ?>
    <?php echo widget('Admin.Menu')->leftMenu(); ?>
    <div class="content">
        <?php echo widget('Admin.Menu')->contentMenu(); ?>
        <?php echo widget('Admin.Common')->crumbs(); ?>
        <div class="main-content">

          <ul class="nav nav-tabs">
            <li class="active"><a href="#home" data-toggle="tab">填写机构信息</a></li>
          </ul>

          <div class="row">
            <div class="col-md-4">
              <br>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="home">
                  <form id="tab" target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
                    <div class="form-group input-group-sm">
                      <label>机构类型</label>
                      <select name="data[type]" class="form-control agency_type">
                          <option value="1">学校</option>
                          <option value="2"<?php if(isset($agencyInfo['type']) && $agencyInfo['type'] ===2):?>selected="selected"<?php endif;?> >省厅</option>
                      </select>
                    </div>
                    <div class="form-group input-group-sm agency_pid_div none">
                      <label>归属机构</label>
                      <select name="data[pid]" class="form-control" id="agency_pid">
                          <option value="0">无</option>
                          <?php foreach($st_list as $k => $v):?>
                          <option value="{{$v['id']}}" <?php if(isset($agencyInfo['pid']) && $agencyInfo['pid'] === $v['id']):?>selected="selected"<?php endif;?> >{{$v['name']}}</option>
                          <?php endforeach;?>
                      </select>
                    </div>
                    <div class="form-group input-group-sm">
                      <label>机构名</label>
                      <input type="text" value="<?php if(isset($agencyInfo['name'])) echo $agencyInfo['name']; ?>" name="data[name]" class="form-control" placeholder="必填">
                    </div>
                    <div class="form-group input-group-sm">
                      <label>机构状态</label>
                        <select class="form-control" name="data[status]">
                            <option value="1">启用</option>
                            <option value="0" <?php if(isset($agencyInfo['status']) && $agencyInfo['status'] ===0):?>selected="selected"<?php endif;?>>禁用</option>
                        </select>
                    </div>
                    <div class="btn-toolbar list-toolbar">
                      <a class="btn btn-primary btn-sm sys-btn-submit" data-loading="保存中..." ><i class="fa fa-save"></i> <span class="sys-btn-submit-str">保存</span></a>
                    </div>
                    <?php if(isset($id)): ?>
                      <input name="data[id]" type="hidden" value="<?php echo $id;?>" />
                    <?php endif; ?>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <?php echo widget('Admin.Common')->footer(); ?>
        </div>
    </div>
    <script>
        $('.agency_type').change(function(){
            var v = $(this).val();
            if (v == 1) {
                $('.agency_pid_div').show();
            } else {
                $('#agency_pid').val(0);
                $('.agency_pid_div').hide();
            }
        });
        $('.agency_type').trigger('change');
    </script>

<?php echo widget('Admin.Common')->htmlend(); ?>