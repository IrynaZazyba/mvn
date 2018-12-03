<#import "parts/common.ftl" as c>

<@c.page>
<div class="container">
    <div class="row">
        <div class="col-12">
            <#if quest??>

                <div class="jumbotron mt-3">


                    <form action="/exeTest" method="post">
                        <div class="row">
                            <div class="col-12 mb-10"><h4>${quest.quest}</h4></div>
                        </div>


                        <#list answers as a>
                            <div class="row">
                                <div class="col-12">
                                    <p><label><input type="checkbox" name="quest">
                                    ${a.answers}</label></p></div>
                            </div></#list>

                        <button type="button" class="btn btn-info">
                            <a href="/exeTest?testsId=${testId}&questionNum=${questionNum}">
                                Next
                            </a>
                        </button>
                    </form>

                </div>
            </#if>


        </div>
    </div>
</div>

</@c.page>