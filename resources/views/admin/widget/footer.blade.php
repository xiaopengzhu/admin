<footer>

</footer>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="<?php echo loadStatic('/lib/html5.js'); ?>"></script>
<![endif]-->

<!-- build:js /public/build/js/main.js-->
<script src="/js/leftmenu.js"></script>
<script src="/js/menumap.js"></script>
<script src="/js/crumbs.js"></script>
<script src="/js/common.js"></script>
<!-- endbuild -->

<iframe frameborder='0' name='hiddenwin' id='hiddenwin' scrolling='no' class='debugwin hidden'></iframe>
<script type="text/javascript">
    $(function() {
        var uls = $('.sidebar-nav > ul > *').clone();
        uls.addClass('visible-xs');
        $('#main-menu').append(uls.clone());
    });
</script>
