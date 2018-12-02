<#import "parts/common.ftl" as c>

<@c.page>
<div class="container-fluid" style="border: 1px solid black">
    <div class="row">
        <div class="col" style="border: 1px solid black">
            <#if quest??>

                <form action="/exeTest" method="post">
                    <p>${quest.quest}</p>
                    <#list answers as a>
                        <p><label><input type="checkbox" name="quest">
                        ${a.answers}</label></p>
                    </#list>
                    <button type="button" class="btn btn-info">Next
                        <a href="/exeTest?testsId=${testId}&questionNum=${questionNum}">
                            Next
                        </a>
                    </button>
                </form>
            </#if>

        </div>
    </div>
</div>

</@c.page>