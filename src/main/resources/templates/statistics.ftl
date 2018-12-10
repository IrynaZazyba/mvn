<#import "parts/common.ftl" as c>

<@c.page>
<div class="container" >

    <div class="row">
        <div class="col-12 text-center">
            <h1>Test already running!</h1>
            <div class="row">
                <div class="col-6">
                    <button type="button" class="btn btn-primary"><a href="/exeTest?stat=${statId}&testsId=${testId}&questionNum=${questNum}">Продолжить</a> </button>
                </div>
                <div class="col-6">
                    <button type="button" class="btn btn-danger"><a href="/stopTest?stat=${statId}&testsId=${testId}&questionNum=${questNum}">Отменить прохождение</a></button>
                </div>
            </div>
        </div>
    </div>
</div>

</@c.page>