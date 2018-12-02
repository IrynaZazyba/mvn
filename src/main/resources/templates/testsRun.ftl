<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/login.ftl" as l>


<@c.page>
    <@n.navBar/>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Menu</h3>
            <strong >BS</strong>
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
                <#list testsType as t>
                <#--<a href="/testsRun?typeId=${t.id}">-->
                    <li >

                        <a href="/testsRun?typeId=${t.id}">
                            <i class="fas fa-briefcase"></i> ${t.type!n/a}
                        </a>
                    </li>
                <#--</a>-->
                </#list>

        </ul>

    </nav>

    <!-- Page Content  -->
    <div id="content">

        <nav id="leftmenu" class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-info">
                    <i class="fas fa-align-left"></i>
                    <span>Toggle Sidebar</span>
                </button>
            </div>
        </nav>
        <#if tests??>
            <#list tests as ts>
                <button type="button" class="btn btn-info">

                    <a href="/exeTest?testsId=${ts.id}&questionNum=0">
                    ${ts.title}
                    </a>
                </button>
            </#list>

        </#if>
    </div>
</div>



<#--<div class="container-fluid" >-->
    <#--<div class="row">-->
        <#--<div class="col-2">-->

        <#--<ul class="list-group list-group-flush">-->
                <#--<#list testsType as t>-->
                <#--&lt;#&ndash;<a href="/testsRun?typeId=${t.id}">&ndash;&gt;-->
                <#--<li class="list-group-item list-group-item-action">-->
                    <#--<a href="/testsRun?typeId=${t.id}">-->
                    <#--${t.type!n/a}-->
                    <#--</a>-->
                    <#--</li>-->
                <#--&lt;#&ndash;</a>&ndash;&gt;-->
                <#--</#list>-->
            <#--</ul>-->
        <#--</div>-->

        <#--<div class="col-10" >-->
            <#--<#if tests??>-->
                <#--<#list tests as ts>-->
                    <#--<button type="button" class="btn btn-info">-->

                         <#--<a href="/exeTest?testsId=${ts.id}&questionNum=0">-->
                        <#--${ts.title}-->
                        <#--</a>-->
                    <#--</button>-->
                <#--</#list>-->

            <#--</#if>-->

        <#--</div>-->
    <#--</div>-->
<#--</div>-->

</@c.page>