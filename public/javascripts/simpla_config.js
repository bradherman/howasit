jQuery(document).ready(function(){
	
	//Sidebar Accordion Menu:
		
		jQuery("#main-nav li ul").hide(); // Hide all sub menus
		jQuery("#main-nav li a.current").parent().find("ul").slideToggle("slow"); // Slide down the current menu item's sub menu
		
		jQuery("#main-nav li a.nav-top-item").click( // When a top menu item is clicked...
			function () {
				jQuery(this).parent().siblings().find("ul").slideUp("normal"); // Slide up all sub menus except the one clicked
				jQuery(this).next().slideToggle("normal"); // Slide down the clicked sub menu
				return false;
			}
		);
		
		jQuery("#main-nav li a.no-submenu").click( // When a menu item with no sub menu is clicked...
			function () {
				window.location.href=(this.href); // Just open the link instead of a sub menu
				return false;
			}
		); 

    // Sidebar Accordion Menu Hover Effect:
		
		jQuery("#main-nav li .nav-top-item").hover(
			function () {
				jQuery(this).stop().animate({ paddingRight: "25px" }, 200);
			}, 
			function () {
				jQuery(this).stop().animate({ paddingRight: "15px" });
			}
		);

    //Minimize Content Box
		
		jQuery(".content-box-header h3").css({ "cursor":"s-resize" }); // Give the h3 in Content Box Header a different cursor
		jQuery(".closed-box .content-box-content").hide(); // Hide the content of the header if it has the class "closed"
		jQuery(".closed-box .content-box-tabs").hide(); // Hide the tabs in the header if it has the class "closed"
		
		jQuery(".content-box-header h3").click( // When the h3 is clicked...
			function () {
			  jQuery(this).parent().next().toggle(); // Toggle the Content Box
			  jQuery(this).parent().parent().toggleClass("closed-box"); // Toggle the class "closed-box" on the content box
			  jQuery(this).parent().find(".content-box-tabs").toggle(); // Toggle the tabs
			}
		);

    // Content box tabs:
		
		jQuery('.content-box .content-box-content div.tab-content').hide(); // Hide the content divs
		jQuery('ul.content-box-tabs li a.default-tab').addClass('current'); // Add the class "current" to the default tab
		jQuery('.content-box-content div.default-tab').show(); // Show the div with class "default-tab"
		
		jQuery('.content-box ul.content-box-tabs li a').click( // When a tab is clicked...
			function() { 
				jQuery(this).parent().siblings().find("a").removeClass('current'); // Remove "current" class from all tabs
				jQuery(this).addClass('current'); // Add class "current" to clicked tab
				var currentTab = jQuery(this).attr('href'); // Set variable "currentTab" to the value of href of clicked tab
				jQuery(currentTab).siblings().hide(); // Hide all content divs
				jQuery(currentTab).show(); // Show the content div with the id equal to the id of clicked tab
				return false; 
			}
		);

    //Close button:
		
		jQuery(".close").click(
			function () {
				jQuery(this).parent().fadeTo(400, 0, function () { // Links with the class "close" will close parent
					jQuery(this).slideUp(400);
				});
				return false;
			}
		);

    // Alternating table rows:
		
		jQuery('tbody tr:even').addClass("alt-row"); // Add class "alt-row" to even table rows

    // Check all checkboxes when the one in a table head is checked:
		
		jQuery('.check-all').click(
			function(){
				jQuery(this).parent().parent().parent().parent().find("input[type='checkbox']").attr('checked', jQuery(this).is(':checked'));   
			}
		);

    // Initialise Facebox Modal window:
		
		jQuery('a[rel*=modal]').facebox(); // Applies modal window to any link with attribute rel="modal"

    // Initialise jQuery WYSIWYG:
		
		jQuery(".wysiwyg").wysiwyg(); // Applies WYSIWYG editor to any textarea with the class "wysiwyg"

});
  
  
  