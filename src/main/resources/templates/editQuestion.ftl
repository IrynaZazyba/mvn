<#import "parts/common.ftl" as c>
<#import "parts/navBar.ftl" as n>
<#import "parts/adminMenuTest.ftl" as at>
<#import "parts/login.ftl" as l>
<@c.page>
    <@n.navBar/>
    <@at.adminMenuTest>

        <#if answer??>
        <div class="alert alert-success" role="alert">${answer}</div>
        </#if>
    <h3 class="ml">Редактирование вопросов и ответов</h3>


    <div class="form-group mmain20">
        <label> Тест: <select class="form-control" id="editTest" name="test">
            <option value=null >Выберите тест</option>
            <#list testsAll as t>
                <#if tests?? && t.id == tests.id >
                    <option value="${t.id}" data-href=/editQuestionAnswer?testId="${t.id}" selected>${t.title}</option>
                <#else>
                    <option value="${t.id}" data-href=/editQuestionAnswer?testId="${t.id}" >${t.title}</option>
                </#if>
            </#list>
        </select>
    </div>
        <#if questAll??>
        <div class="form-group mmain20">
        <label> Вопросы: <select class="form-control" name="test" id="editQuest">
            <option value=null>Выберите вопрос</option>
            <#list questAll as q>
                <#if quest?? && q.id == quest.id >
                    <option value="${q.id}"  selected>${q.quest}</option>
                <#else>
                    <option value="${q.id}">${q.quest}</option>
                </#if>
            </#list>
        </select>
        </#if>
    </div>
        <#if quest??>
        <form action="/editQuestionAnswer" method="post" xmlns="http://www.w3.org/1999/html">
            <div>
                <input type="hidden" name="test" value="${tests.id}">
                <input type="hidden" name="questId" value="${quest.id}">
                <label for="exampleFormControlInput1"> Вопрос : </label> <textarea class="form-control" type="text"
                                                                                   name="quest" rows="5" >${quest.quest}</textarea>
            </div>

        <#--<input type="hidden" value="${testId}" name="test">-->
        <div class="form-group">
            <i>Ответы</i><br/>
            <#if answers??>
                <#assign itr = 1>
                <#list quest.getAnswers() as an>
                    <div>
                        <label for="exampleFormControlInput1"> answer #${itr} :
                            <input class="form-control" type="text" name="answer${itr}" value="${an.answers}"/>
                        </label><br/>
                        <#if an.trues==false >
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" value=0 name="ck_answer${itr}" checked> Не
                                верно
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" value=1 name="ck_answer${itr}"> Верно
                            </div>
                        <#else>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" value=0 name="ck_answer${itr}" > Не верно
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" value=1 name="ck_answer${itr}" checked> Верно
                            </div>
                        </#if>


                    </div>
                    <#assign itr++>
                </#list>
            </#if>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div><button class="btn btn butSuccess" type="submit">Сохранить</button></div>
            <div><button class="btn btn" type="button" >Удалить</button></div>
        </#if>
    </form>
    </@at.adminMenuTest>
</@c.page>