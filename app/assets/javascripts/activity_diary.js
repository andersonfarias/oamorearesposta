$(document).ready(function() {

    var beforeInsertCocoon = function(form, insertedItem) {
        var beneficiary_id_input = form.find("input[type='hidden']");
        var first_time = beneficiary_id_input.size() == 0;
        var beneficiary_id = beneficiary_id_input.val();
        if (!first_time && !beneficiary_id) insertedItem.addClass('invalid');
    }

    var afterInsertCocoon = function(form, table, insertedItem) {
        var is_invalid = $(insertedItem).filter('.invalid').size() > 0;
        $(insertedItem).filter('.invalid').remove();

        $(insertedItem).find('input[data-provide="typeahead"][data-source-query]').each(function() {
            autocomplete_query($(this));
        });

        if (is_invalid) {
            form.find(".show_when_invalid").each(function() {
                var element = $(this);
                var container = element.prev().addClass('has-error');

                if (container.find('.show_when_invalid').size() == 0) {
                    container.append(element.clone().removeClass('hidden'));
                }
            });
        } else {
            // gets the data from the previous inputs
            var beneficiary_fields_container = form.find('.activity_diary_attendances_beneficiary:last');
            var beneficiary_id_input = beneficiary_fields_container.find("input[type='hidden']").clone();
            var beneficiary_name = beneficiary_fields_container.find("input[data-provide=\"typeahead\"]").val();
            var observation_input = form.find('.activity_diary_attendances_observation:last').find('textarea');

            var index = table.find("tbody tr").size();
            // Add new line to table
            var newLine = $("<tr>")
                .append(
                    $("<input>").attr('type', 'hidden').attr('name', "activity_diary[attendances_attributes][" + index + "][beneficiary_id]").val(beneficiary_id_input.val()),
                    $("<input>").attr('type', 'hidden').attr('name', "activity_diary[attendances_attributes][" + index + "][observation]").val(observation_input.val()),
                    $("<td>").addClass('row').append(
                        $("<span>").addClass('col-md-12 col-sm-12 col-xs-12').text(beneficiary_name),
                        $("<div>").addClass('observation-text col-md-12 col-sm-12 col-xs-12').append(
                            $("<h5>").text("Observação"),
                            $("<p>").text(observation_input.val()).css('word-wrap', 'break-word')
                        ).hide()
                    ),
                    $("<td>").addClass("text-center").append(
                        $("<a>").addClass("show_observation_activity_diary").append(
                            $("<i>").addClass("fa fa-plus fa-lg")
                        ),
                        $("<a>").addClass("remove_beneficiary_activity_diary").append(
                            $("<i>").addClass("fa fa-trash fa-lg")
                        )
                    )
                );

            table.append(newLine);

            // Remove the old inputs
            form.find(".row").each(function() {
                if ($(this).index() == 2 || $(this).index() == 3) $(this).remove();
            });
        }
    }

    var onTableClick = function(e, table) {
        var clickedToRemoveItem = $(e.target).parent().is('.remove_beneficiary_activity_diary');
        if (clickedToRemoveItem) {
            $(e.target).closest("tr").remove();
            table.find("tbody tr").each(function() {
                var index = $(this).index();
                $(this).find("input[type='hidden']").each(function() {
                    var name = $(this).attr('name');
                    $(this).attr('name', name.replace(/\d+/i, index + ''));
                });
            });

            return;
        }

        var clickedToShowObservation = $(e.target).parent().is('.show_observation_activity_diary');
        if (clickedToShowObservation) {
            var observationTextDiv = $(e.target).closest("tr").find(".observation-text");
            if (observationTextDiv.is(":visible")) {
                observationTextDiv.fadeOut();
            } else {
                observationTextDiv.fadeIn();
            }
            return;
        }
    }

    var onFileTableClick = function(e, table) {
        var clickedToRemoveItem = $(e.target).parent().is('.remove_file_activity_diary');
        if (clickedToRemoveItem) {
            $(e.target).closest("tr").remove();
            table.find("tbody tr").each(function() {
                var index = $(this).index();
                $(this).find("input[type='hidden']").each(function() {
                    var name = $(this).attr('name');
                    $(this).attr('name', name.replace(/\d+/i, index + ''));
                });
            });

            return;
        }
    }

    $('#activity_diary_attendances_nested_form').on('cocoon:before-insert', function(e, insertedItem) {
        beforeInsertCocoon($('#activity_diary_attendances_nested_form'), insertedItem);
    });

    $('#activity_diary_attendances_nested_form_edit').on('cocoon:before-insert', function(e, insertedItem) {
        beforeInsertCocoon($('#activity_diary_attendances_nested_form_edit'), insertedItem);
    });

    $('#activity_diary_attendances_nested_form').on('cocoon:after-insert', function(e, insertedItem) {
        afterInsertCocoon($('#activity_diary_attendances_nested_form'), $("#activity_diary_attendances_create_table"), insertedItem);
    });

    $('#activity_diary_attendances_nested_form_edit').on('cocoon:after-insert', function(e, insertedItem) {
        afterInsertCocoon($('#activity_diary_attendances_nested_form_edit'), $("#activity_diary_attendances_edit_table"), insertedItem);
    });

    $('#activity_diary_attendances_create_table').on('click', function(e) {
        onTableClick(e, $('#activity_diary_attendances_create_table'));
    });

    $('#activity_diary_attendances_edit_table').on('click', function(e) {
        onTableClick(e, $('#activity_diary_attendances_edit_table'));
    });

    $('#activity_diary_files_edit_table').on('click', function(e) {
        onFileTableClick(e, $('#remove_file_activity_diary'));
    });

    $('#activity_diary_attendances_create_table .observation-text').hide();
    $('#activity_diary_attendances_edit_table .observation-text').hide();

    $('#activity_diary_attendances_nested_form_edit').children().each(function() {
        if ($(this).index() > 2) {
            $(this).remove();
        } else {
            $(this).find("input").val("");
            $(this).find("textarea").text("");
        }
    });

});
