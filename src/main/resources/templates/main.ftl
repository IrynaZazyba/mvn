<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
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
            <button type="button" class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal"
                    data-target="#exampleModalCenter">Log in
            </button>
        <#else> <span class="headerUser">${username}</span>
        <@l.logout />
        </#if>

    </div>

</nav>
<div class="container">
    <div class="row align-items-center heightAll">
        <div class="col"></div>
    <#--<#if auth==false>-->
        <div class="col-6 text-center"><h1 class="font-weight-bold text-white-50 ">Hi, nice to meet you!</h1>
        <#--<button type="button" class="btn btn-outline-light btn-lg" data-toggle="modal"-->
        <#--data-target="#exampleModalCenter">Get started-->
        <#--</button>-->
        <#--</div>-->
        <#--</#if>-->

            <div class="col"></div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Log In</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="/" id="login" method="post">
                    <div class="modal-body">

                        <div class="form-group">
                            <label for="formGroupExampleInput">Username</label>
                            <input type="text" name="username" class="form-control" type="text"  id="formGroupExampleInput" placeholder="Username" >
                        </div>
                        <div class="form-group">
                            <label for="formGroupExampleInput2">Password</label>
                            <input type="password" name="password" class="form-control" type="text" placeholder="Password" id="formGroupExampleInput2" >
                        </div>

                        <#---->
                        <#---->
                        <#--<div><input type="text" name="username" class="form-control" type="text" placeholder="Username"></div>-->
                        <#--<div><input type="password" name="password" class="form-control" type="text" placeholder="Password"></div>-->
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <#--<div><input type="submit" value="Sign In"/></div>-->


                    </div>
                    <div class="modal-footer">
                        <div class="create_account"><a href="/registration">Create account</a></div>
                    <#--<button type="button" class="btn btn-secondary" data-dismiss="modal">Exit</button>-->
                        <button type="submit" id="subButton" class="btn btn-primary">Log In</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</@c.page>