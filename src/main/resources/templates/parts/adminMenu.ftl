<#macro adminMenu>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Menu</h3>
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
                    <i class="fas fa-briefcase"></i>Edit users
                </a>
            </li>
            <li>
                <a href="#"><i class="fas fa-briefcase"></i>Add users
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