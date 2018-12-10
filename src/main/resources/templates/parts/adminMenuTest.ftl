<#macro adminMenuTest>
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

                <a href="/addTestsType">
                    <i class="fas fa-briefcase"></i>Add type of tests
                </a>
            </li>
            <li>
                <a href="/addTestsTitle"><i class="fas fa-briefcase"></i>Add title
                </a>
            </li>
            <li>
                <a href="/addQuestionAnswer"><i class="fas fa-briefcase"></i>Add questions+answers
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