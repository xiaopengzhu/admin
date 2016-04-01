$(function () {
    $(this).on('click', '.content-menu-button', function(){
        window.location.href = $(this).attr('data-href');
    });
});