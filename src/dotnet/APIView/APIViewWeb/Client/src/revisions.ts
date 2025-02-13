$(() => {
  $(document).on("click", ".revision-rename-icon", e => {
    toggleNameField($(e.target));
  });

  $(document).on("click", ".cancel-revision-rename", e => {
    var icon = $(e.target).parent().siblings(".revision-rename-icon");
    toggleNameField(icon);
  });

  $(document).on("click", ".submit-revision-rename", e => {
    $(e.target).parents(".revision-rename-form").submit();
  });

  function toggleNameField(renameIcon: JQuery) {
    renameIcon.toggle();
    renameIcon.siblings(".revision-name-input").toggle();
  }

  const languageSelect = $('#revision-language-select');
  languageSelect.on('change', function (e) {
    const fileSelectors = $(".package-file-selector");
    for (var i = 0; i < fileSelectors.length; i++) {
      $(fileSelectors[i]).toggleClass("hidden-row");
    }
  });
});
