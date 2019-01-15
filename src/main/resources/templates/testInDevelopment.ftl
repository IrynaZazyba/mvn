<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenuTest.ftl" as at>
<#import "parts/login.ftl" as l>

<@c.page>
    <@n.navBar/>


<div class="row">
    <div class="col-xs-5 col-6 mauto">
        <div class="project project-info">
            <div class="shape">
                <div class="shape-text">
                    alert
                </div>
            </div>
            <div class="project-content">
                <h3 class="lead">
                </h3>
                <p class="tc mt10">
                    Извините, тест находится в разработке. Пожалуйста, попробуйте позже
                </p>
                <br>
                <div class="mauto ta">
                    <a href="/testsRun"><button type="button" class="btn but wth100"> Назад</button></a>
                </div>
            </div>
        </div>
    </div>
</div>

</@c.page>