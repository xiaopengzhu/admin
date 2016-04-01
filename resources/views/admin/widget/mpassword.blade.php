<div class="none modify-password-content">
    <div class="form-group  input-group-sm">
        <label>旧密码</label>
        <input type="password" value="" name="old_password" class="form-control">
    </div>
    <div class="form-group  input-group-sm">
        <label>新密码</label>
        <input type="password" value="" name="new_password" class="form-control">
    </div>
    <div class="form-group  input-group-sm">
        <label>确认新密码</label>
        <input type="password" value="" name="new_password_repeat" class="form-control">
    </div>
</div>
<script type="text/javascript">
    cacheData.postUrl = '<?php echo R('common', 'foundation.user.mpassword'); ?>';
</script>