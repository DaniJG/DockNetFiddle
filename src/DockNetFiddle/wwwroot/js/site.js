// Write your Javascript code.
$(function () {
    var programFormEl = $("#program-form");
    var resultEl = $("#program-result");
    var resultContainerEl = $("#program-result-container");

    $("#enable-projectjson").change(function () {
        if ($(this).is(":checked")) {
            $("#ProjectJSON").removeAttr('disabled');
        } else {
            $("#ProjectJSON").attr('disabled', 'disabled');
        }
    });

    $("#run-program-btn").click(runProgram);

    function runProgram() {
        if (!programFormEl.valid()) return false;

        var data = {
            program: $("#Program").val(),
            projectjson: $("#enable-projectjson").is(":checked") ? $("#ProjectJSON").val() : null
        };

        $.ajax({
            method: 'POST',
            url: '/run',
            data: JSON.stringify(data),
            contentType: 'application/json',
            dataType: 'json',
            success: showResults
        });

        return false;
    }

    function showResults(data, status, xhr) {
        if (data && data.result) {
            resultEl.html(data.result);
            resultContainerEl.removeClass("hidden");
        }                
    }

});