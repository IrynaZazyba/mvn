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
            <#if menu??&&menu==1>
            <li class="active">
                <a href="/addTestsType">
                    <i class="fas fa-briefcase"></i> Добавить раздел
                </a>
            </li>
            <#else>
                <li>
                    <a href="/addTestsType">
                        <i class="fas fa-briefcase"></i> Добавить раздел
                    </a>
                </li>
            </#if>
    <#if menu??&&menu==2>
               <li  class="active">
                <a href="/addTestsTitle"><i class="fas fa-briefcase"></i> Добавить тест
                </a>
            </li>
    <#else>
        <li>
            <a href="/addTestsTitle"><i class="fas fa-briefcase"></i> Добавить тест
            </a>
        </li>
    </#if>
    <#if menu??&&menu==3>
            <li class="active">
                <a href="/addQuestionAnswer"><i class="fas fa-briefcase"></i> Добавить вопросы и ответы
                </a>
            </li>
    <#else>
        <li>
            <a href="/addQuestionAnswer"><i class="fas fa-briefcase"></i> Добавить вопросы и ответы
            </a>
        </li>
    </#if>

        <#--</a>-->

        </ul>

    </nav>
    <div id="content">
        <#nested >
    </div>

</div>
</#macro>