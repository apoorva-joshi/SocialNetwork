$(document).ready(function() {

		$('.notification').click(function() {
			var badge = $(this).find(".badge");
				$.ajax(
						{

							type : "GET",
							url : "markRead",
							success : function(data) {
								$(badge).html(data);
							},
							error : function(xhr, ajaxOptions, thrownError) {
	                        alert(xhr.status);
	                        alert(thrownError);
							}
					});
		});
});