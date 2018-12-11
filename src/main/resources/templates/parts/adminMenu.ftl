<#macro adminMenu>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <strong>BS</strong>
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
            <li>

                <a href="/user">
                    <i class="mr7 fas fa-user"></i>Edit users
                </a>
            </li>
            <li>
                <a href="/"><i class="mr5 fas fa-user-plus"></i>Add users
                </a>
            </li>
        <#--</a>-->

        </ul>

    </nav>
    <div id="content">
        <#nested >
    </div>

</div>
</#macro>