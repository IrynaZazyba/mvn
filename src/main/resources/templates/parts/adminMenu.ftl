<#macro adminMenu>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <strong>ACT</strong>
        </div>

        <ul class="list-unstyled components">
        <#--<li class="active">-->
        <#--<a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">-->
        <#--<i class="fas fa-home"></i>-->
        <#--Home-->
        <#--</a>-->
        <#--<ul class="collapse list-unstyled" id="homeSubmenu">-->
        <#--<li>-->
        <#--<a href="#">Home 1</a>-->
        <#--</li>-->
        <#--</ul>-->
        <#--</li>-->
        <#--<a href="/testsRun?typeId=${t.id}">-->
    <#if menu?? && menu==2>
            <li class="active">
                <a href="/user"><i class="mr7 fas fa-user"></i> Редактировать пользователей
                </a>
            </li>
    <#else>
        <li>
            <a href="/user"><i class="mr7 fas fa-user"></i> Редактировать пользователей
            </a>
        </li>
    </#if>
    <#if menu?? && menu==1>

        <li class="active">
                <a href="/addUser"><i class="mr5 fas fa-user-plus"></i>Добавить пользователя
                </a>
            </li>
        <#--</a>-->
<#else>
    <li>
        <a href="/addUser"><i class="mr5 fas fa-user-plus"></i>Добавить пользователя
        </a>
    </li>
</#if>


  <#if menu?? && menu==3>

        <li class="active">
            <a href="/user/delete"><i class="mr5 fas fa-user-minus"></i>Удалить пользователя
            </a>
        </li>
                <#--</a>-->
                <#else>
    <li>
        <a href="/user/delete"><i class="mr5 fas fa-user-minus"></i>Удалить пользователя
        </a>
    </li>
                </#if>
</ul>

    </nav>
    <div id="content">
        <nav id="leftmenu" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                    <span>Toggle Sidebar</span>
                </button>
            </div>
        </nav>
        <#nested >
    </div>

</div>
</#macro>