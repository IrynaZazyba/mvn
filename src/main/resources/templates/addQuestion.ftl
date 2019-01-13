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
    <h3 class="ml">Добавление вопросов и ответов</h3>

    <form action="/addQuestionAnswer" method="post" xmlns="http://www.w3.org/1999/html">
        <div class="form-group mmain20">
            <label> Название: <select class="form-control" name="test">
                <#list tests as t>
                    <option value="${t.id}">${t.title}</option>
                </#list>
            </select>
        </div>

        <div>
            <label for="exampleFormControlInput1"> Вопрос : </label> <textarea class="form-control" type="text"
                                                                         name="quest" rows="5" ></textarea>

        </div>
    <#--<input type="hidden" value="${testId}" name="test">-->
        <div class="form-group">
            <i>Ответы</i><br/>
            <div><label for="exampleFormControlInput1"> answer #1 : <input class="form-control" type="text"
                                                                           name="answer1"/>
            </label><br/>
                <div class="form-check form-check-inline">

                    <input class="form-check-input" type="radio" value=0 name="ck_answer1" checked> Не верно
                </div>
                <div class="form-check form-check-inline">

                    <input class="form-check-input" type="radio" value=1 name="ck_answer1"> Верно
                </div>
            </div>
            <br/>
            <div><label for="exampleFormControlInput1"> answer #2 : <input class="form-control" type="text"
                                                                           name="answer2"/>
            </label><br/>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value=0 name="ck_answer2" checked> Не верно
                </div>
                <div class="form-check form-check-inline">

                    <input class="form-check-input" type="radio" value=1 name="ck_answer2"> Верно
                </div>

            </div>
            <br/>
            <div><label for="exampleFormControlInput1"> answer #3 : <input class="form-control" type="text"
                                                                           name="answer3"/>
            </label><br/>
                <div class="form-check form-check-inline">

                    <input class="form-check-input" type="radio" value=0 name="ck_answer3" checked> Не верно
                </div>
                <div class="form-check form-check-inline">

                    <input class="form-check-input" type="radio" value=1 name="ck_answer3"> Верно
                </div>
            </div>
            <br/>
            <div><label for="exampleFormControlInput1"> answer #4 : <input class="form-control" type="text"
                                                                           name="answer4"/>
            </label><br/>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value=0 name="ck_answer4" checked> Не верно
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" value=1 name="ck_answer4"> Верно
                </div>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div><button class="btn btn butSuccess" type="submit">Добавить</button></div>
    </form>
    </@at.adminMenuTest>
</@c.page>