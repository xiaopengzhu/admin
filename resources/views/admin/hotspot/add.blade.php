<?php echo widget('Admin.Common')->header(); ?>
    <?php echo widget('Admin.Common')->top(); ?>
    <?php echo widget('Admin.Menu')->leftMenu(); ?>
    <div class="content">
        <?php echo widget('Admin.Menu')->contentMenu(); ?>
        <?php echo widget('Admin.Common')->crumbs(); ?>
        <div class="main-content">

          <ul class="nav nav-tabs">
            <li class="active"><a href="#home" data-toggle="tab">填写热点信息</a></li>
          </ul>

          <div class="row">
            <div class="col-md-4">
              <br>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane active in" id="home">
                  <form id="tab" target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
                    <div class="form-group input-group-sm">
                      <label>热点名</label>
                      <input type="text" value="<?php if(isset($hotspotInfo['name'])) echo $hotspotInfo['name']; ?>" name="data[name]" class="form-control" placeholder="必填">
                    </div>
                    <div class="form-group input-group-sm">
                      <label>所属学校</label>
                      <input type="hidden" name="data[agency_id]" value="<?php if(isset($hotspotInfo['agency_id'])) echo $hotspotInfo['agency_id']; elseif(isset($agency_id)) echo $agency_id; ?>">
                      <input type="text" disabled value="<?php if(isset($agency_name)) echo $agency_name;  ?>" class="form-control" placeholder="必填">
                    </div>
                    <div class="form-group input-group-sm">
                      <label>热点状态</label>
                        <select class="form-control" name="data[status]">
                            <option value="1">启用</option>
                            <option value="0" <?php if(isset($hotspotInfo['status']) && $hotspotInfo['status'] ===0):?>selected="selected"<?php endif;?>>禁用</option>
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
<?php echo widget('Admin.Common')->htmlend(); ?>