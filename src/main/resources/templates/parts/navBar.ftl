<#macro navBar>
<div class="color-for-bar"></div>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
    <a class="navbar-brand" href="#">Test</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if userrole?? && (userrole=="USER" ||userrole=="ADMIN")>
                <li class="nav-item">
                    <a class="nav-link" href="/testsRun">Tests</a>
                </li></#if>
            <#if userrole?? &&userrole=="ADMIN">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Admin panel
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/userEdit">Edit users</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="/addTests">Edit tests</a>
                    </div>
                </li>

            <#--<li class="nav-item">-->
            <#--<a class="nav-link" href="/adminPanel">Admin panel</a>-->
            <#--</li>-->
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="#">About as</a>
            </li>
        </ul>
        <#if auth==false>
            <button type="button" class="btn my-2 my-sm-0 but" data-toggle="modal"
                    data-target="#exampleModalCenter">Log in
            </button>
                   <#else> <span class="headerUser">${username}</span>
            <@l.logout />
        </#if>

    </div>
</nav>
</#macro>