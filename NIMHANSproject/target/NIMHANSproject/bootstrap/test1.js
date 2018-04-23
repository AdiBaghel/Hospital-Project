$(document).ready(function() {
    $("div.innerForm-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.innerForm-tab>div.innerForm-tab-content").removeClass("active");
        $("div.innerForm-tab>div.innerForm-tab-content").eq(index).addClass("active");
    });
});