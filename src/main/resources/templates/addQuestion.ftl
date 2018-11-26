<#import "parts/common.ftl" as c>
<@c.page>
<h3>Add questions for ${testTitle}!</h3>

<form action="/addQuestion" method="post">
    <div><label> Questions : <input type="text" name="quest"/> </label></div>
    <input type="hidden" value="${testId}" name="test">
<div>
    <i>Ответы</i><br/>
    <div><label> answer #1 : <input type="text" name="answer1"/> </label><br/>
        <label>
            <input type="radio" value=0 name="ck_answer1" checked > Не верно
            <input type="radio" value=1 name="ck_answer1"> Верно </label>
    </div>
    <br/>
    <div><label> answer #2 : <input type="text" name="answer2"/> </label><br/>
        <label>
            <input type="radio" value=0 name="ck_answer2" checked > Не верно
            <input type="radio" value=1 name="ck_answer2"> Верно</label>
    </div>
    <br/>
    <div><label> answer #3 : <input type="text" name="answer3"/> </label><br/>
        <label>
            <input type="radio" value=0 name="ck_answer3" checked > Не верно
            <input type="radio" value=1 name="ck_answer3"> Верно </label>
    </div>
    <br/>
    <div><label> answer #4 : <input type="text" name="answer4"/> </label><br/>
        <label>
            <input type="radio" value=0 name="ck_answer4" checked > Не верно
            <input type="radio" value=1 name="ck_answer4"> Верно </label>
    </div>
</div>
<input type="hidden" name="_csrf" value="${_csrf.token}"/>
<div><input type="submit" value="Add"/></div>
</form>

</@c.page>