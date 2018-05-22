<nav class="pcoded-navbar">
    <div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
    <div class="pcoded-inner-navbar main-menu">

        <ul class="pcoded-item pcoded-left-item">
            <li class="">
                <a href="index">
                    <span class="pcoded-micon"><i class="ti-home"></i><b>D</b></span>
                    <span class="pcoded-mtext" data-i18n="nav.dash.main">首页</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>
            <li class="pcoded-hasmenu pcoded-trigger">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                    <span class="pcoded"  data-i18n="nav.basic-components.main">CISP平台</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">
                    <li class="">
                        <a href="javascript:void(0)" onclick="tab(1)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">会员管理</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    <li class="">
                        <a href="javascript:void(0)" onclick="tab(2)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">平台查询统计</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="javascript:void(0)" onclick="tab(3)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">会员机构统计</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>

                </ul>
            </li>
        </ul>
        <#--<ul class="pcoded-item pcoded-left-item">-->
            <#--<li class="pcoded-hasmenu ">-->
                <#--<a href="javascript:void(0)">-->
                    <#--<span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>M</b></span>-->
                    <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.main">下载管理</span>-->
                    <#--<span class="pcoded-mcaret"></span>-->
                <#--</a>-->
                <#--<ul class="pcoded-submenu">-->
                    <#--<li class="pcoded-hasmenu ">-->
                        <#--<a href="javascript:void(0)">-->
                            <#--<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>-->
                            <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">期刊</span>-->
                            <#--<span class="pcoded-mcaret"></span>-->
                        <#--</a>-->
                        <#--<ul class="pcoded-submenu">-->
                            <#--<li class="">-->
                                <#--<a href="javascript:void(0)">-->
                                    <#--<span class="pcoded-micon"><i class="ti-angle-right"></i></span>-->
                                    <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu Level 3.1</span>-->
                                    <#--<span class="pcoded-mcaret"></span>-->
                                <#--</a>-->
                            <#--</li>-->
                        <#--</ul>-->
                    <#--</li>-->

                    <#--<li class="pcoded-hasmenu ">-->
                        <#--<a href="javascript:void(0)">-->
                            <#--<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>-->
                            <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">文档</span>-->
                            <#--<span class="pcoded-mcaret"></span>-->
                        <#--</a>-->
                        <#--<ul class="pcoded-submenu">-->
                            <#--<li class="">-->
                                <#--<a href="javascript:void(0)">-->
                                    <#--<span class="pcoded-micon"><i class="ti-angle-right"></i></span>-->
                                    <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu Level 3.1</span>-->
                                    <#--<span class="pcoded-mcaret"></span>-->
                                <#--</a>-->
                            <#--</li>-->
                        <#--</ul>-->
                    <#--</li>-->

                    <#--<li class="pcoded-hasmenu ">-->
                        <#--<a href="javascript:void(0)">-->
                            <#--<span class="pcoded-micon"><i class="ti-direction-alt"></i></span>-->
                            <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.main">驱动</span>-->
                            <#--<span class="pcoded-mcaret"></span>-->
                        <#--</a>-->
                        <#--<ul class="pcoded-submenu">-->
                            <#--<li class="">-->
                                <#--<a href="javascript:void(0)">-->
                                    <#--<span class="pcoded-micon"><i class="ti-angle-right"></i></span>-->
                                    <#--<span class="pcoded-mtext" data-i18n="nav.menu-levels.menu-level-22.menu-level-31">Menu Level 3.1</span>-->
                                    <#--<span class="pcoded-mcaret"></span>-->
                                <#--</a>-->
                            <#--</li>-->
                        <#--</ul>-->
                    <#--</li>-->

                <#--</ul>-->
            <#--</li>-->
        <#--</ul>-->
        <ul class="pcoded-item pcoded-left-item">
            <li class="pcoded-hasmenu ">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i><b>M</b></span>
                    <span class="pcoded-mtext">下载管理</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">
                    <li class="">
                        <a href="javascript:void(0)" onclick="tab(7)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext">期刊</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>

                    <li class="">
                        <a href="javascript:void(0)" onclick="tab(8)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext">文档</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>

                    <li class="">
                        <a href="javascript:void(0)" onclick="tab(9)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext">驱动</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>

                </ul>
            </li>
        </ul>
        <ul class="pcoded-item pcoded-left-item">
            <li class="pcoded-hasmenu">
                <a href="javascript:void(0)">
                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                    <span class="pcoded"  data-i18n="nav.basic-components.main">资讯管理</span>
                    <span class="pcoded-mcaret"></span>
                </a>
                <ul class="pcoded-submenu">
                    <li class=" ">
                        <a href="javascript:void(0)" onclick="tab(4)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">资讯列表</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>
                    <li class=" ">
                        <a href="javascript:void(0)" onclick="tab(5)">
                            <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
                            <span class="pcoded-mtext" data-i18n="nav.basic-components.breadcrumbs">资讯编辑</span>
                            <span class="pcoded-mcaret"></span>
                        </a>
                    </li>

                </ul>
            </li>
        </ul>

        <ul class="pcoded-item pcoded-left-item">
            <li class="pcoded-hasmenu">
                <a href="javascript:void(0)" onclick="tab(10)">
                    <span class="pcoded-micon"><i class="ti-layout-grid2-alt"></i></span>
                    <span class="pcoded"  data-i18n="nav.basic-components.main">问题反馈</span>
                    <span class="pcoded-mcaret"></span>
                </a>
            </li>

        </ul>

    </div>
</nav>

<script type="text/javascript" src="static/js/nav.js"></script>