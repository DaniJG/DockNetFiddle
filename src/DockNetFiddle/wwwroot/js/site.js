// Write your Javascript code.
$(function () {
    var programFormEl = $("#program-form");
    var resultEl = $("#program-result");
    var resultContainerEl = $("#program-result-container");

    $("#enable-project").change(function () {
        if ($(this).is(":checked")) {
            $("#Project").removeAttr('disabled');
        } else {
            $("#Project").attr('disabled', 'disabled');
        }
    });

    $("#run-program-btn").click(runProgram);

    function runProgram() {
        if (!programFormEl.valid()) return false;

        var data = {
            program: $("#Program").val(),
            project: $("#enable-project").is(":checked") ? $("#Project").val() : null
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