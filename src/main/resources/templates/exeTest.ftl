<#import "parts/common.ftl" as c>

<@c.page>
<div class="container">
    <div class="row">
        <div class="col-12 timer">
            Время на вопрос <span id="timerQ"></span>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <#if quest??>

                <div class="jumbotron mt-3">


                    <form id="qForm" action="/exeTestCheck" method="post">
                        <div class="row">
                            <input type="hidden" name="testsId" value=${testId}>
                            <input type="hidden" name="stat" value=${stat}>
                            <div class="col-12 mb-10"><h4>#${questionNum-1}: ${quest.quest}</h4></div>
                            <input type="hidden" name="questId" value=${questid}>
                            <input type="hidden" name="questionNum" value=${questionNum} >
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        </div>


                        <#list answers as a>
                            <div class="row">
                                <div class="col-12">
                                    <p><label><input type="checkbox" value=${a.id} name="option${a?counter}">
                                    ${a.answers}</label></p></div>
                            </div></#list>

                        <button type="submit" class="btn btn-info"> OK
                            <#--<a href="/exeTest?testsId=${testId}&questionNum=${questionNum}">-->
                              <#---->
                            <#--</a>-->
                        </button>
                    </form>

                </div>
            </#if>


        </div>
    </div>
</div>

</@c.page>