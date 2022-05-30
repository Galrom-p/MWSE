#pragma once

#include "TES3Defines.h"

namespace TES3 {
	namespace UI {
		struct MenuController;

		typedef short UI_ID;

		// Note that all properties are UI_IDs, and custom properties can be made at runtime.
		// Therefore the Property enum contains the UI_IDs of pre-registered properties.
		// UI_ID and Property are convertible.

		enum class PropertyType : short {
			INVALID = 0x0,
			Integer = 0x1,
			Float = 0x2,
			Unknown_4 = 0x4,
			Pointer = 0x8,
			Property = 0x10,
			EventCallback = 0x20,
			PropertyAccessCallback = 0x40,
		};

		enum class Property : short {
			err_failed = -0x8000,
			err_success = -0x7FFF,
			err_null_pointer = -0x7FFE,
			err_does_not_exist = -0x7FFD,
			err_cant_load_model = -0x7FFC,
			err_value_is_pointer = -0x7FFB,
			err_bad_pointer_type = -0x7FFA,
			err_free_memory = -0x7FF9,
			err_incorrect_type = -0x7FF8,
			id = -0x7FF7,
			name = -0x7FF6,
			border = -0x7FF5,
			border_top = -0x7FF4,
			border_left = -0x7FF3,
			border_bottom = -0x7FF2,
			border_right = -0x7FF1,
			padding = -0x7FF0,
			padding_top = -0x7FEF,
			padding_bottom = -0x7FEE,
			padding_left = -0x7FED,
			padding_right = -0x7FEC,
			type = -0x7FEB,
			font = -0x7FEA,
			pointer = -0x7FE9,
			x_loc = -0x7FE8,
			y_loc = -0x7FE7,
			abs_x = -0x7FE6,
			abs_y = -0x7FE5,
			y_visible = -0x7FE4,
			node_min_x = -0x7FE1,
			node_max_x = -0x7FE0,
			node_min_y = -0x7FDF,
			node_max_y = -0x7FDE,
			clip_min_x = -0x7FDB,
			clip_max_x = -0x7FDA,
			clip_min_y = -0x7FD9,
			clip_max_y = -0x7FD8,
			mid_x = -0x7FD7,
			mid_y = -0x7FD6,
			width = -0x7FD5,
			height = -0x7FD4,
			min_width = -0x7FD3,
			min_height = -0x7FD2,
			max_width = -0x7FD1,
			max_height = -0x7FD0,
			extra_data = -0x7FCF,
			event_mouse_leave = -0x7FCE,	// named 'idle' in engine
			event_mouse_over = -0x7FCD,		// named 'over' in engine
			event_mouse_down = -0x7FCC,		// named 'pressed' in engine
			event_mouse_click = -0x7FCB,	// named 'click' in engine
			event_mouse_scroll_up = -0x7FCA,
			event_mouse_scroll_down = -0x7FC9,
			event_mouse_double_click = -0x7FC8,
			event_mouse_still_idle = -0x7FC7,
			event_mouse_still_over = -0x7FC6,
			event_mouse_still_pressed_outside = -0x7FC5,
			event_mouse_still_pressed = -0x7FC4,
			event_mouse_release = -0x7FC3,
			event_key_press = -0x7FC2,		// named 'key' in engine
			event_key_enter = -0x7FC1,		// named 'enter' in engine
			event_leave_menu_mode = -0x7FC0,
			event_enter_menu_mode = -0x7FBF,
			event_focus = -0x7FBE,
			event_unfocus = -0x7FBD,
			event_update = -0x7FBC,
			event_pre_update = -0x7FBB,
			update_disable = -0x7FBA,
			event_destroy = -0x7FB9,
			focusable = -0x7FB8,
			hypertext = -0x7FB7,
			override = -0x7FB6,
			draggable = -0x7FB5,
			resizable = -0x7FB4,
			red = -0x7FB3,
			green = -0x7FB2,
			blue = -0x7FB1,
			alpha = -0x7FB0,
			use_global_alpha = -0x7FAF,
			layout_float = -0x7FAE,			// named 'float' in engine
			layout_break = -0x7FAD,			// named 'break' in engine
			align_x = -0x7FAC,
			align_y = -0x7FAB,
			children_expand = -0x7FAA,
			family = -0x7FA9,
			is_part = -0x7FA8,
			flow_direction = -0x7FA7,
			remaining_x = -0x7FA6,
			remaining_y = -0x7FA5,
			pre_process_setprop = -0x7FA4,
			post_process_setprop = -0x7FA3,
			pre_process_getprop = -0x7FA2,
			child_offset_x = -0x7FA1,
			child_offset_y = -0x7FA0,
			wrap_text = -0x7F9F,
			help_menu = -0x7F9E,
			help_tooltip = -0x7F9D,
			scale_mode = -0x7F9C,
			justify = -0x7F9B,
			use_paragraph_height = -0x7F9A,
			shunt_children = -0x7F99,
			text_inherit = -0x7F98,
			filename_inherit = -0x7F97,
			node_offset_x = -0x7F96,
			node_offset_y = -0x7F95,
			disabled = -0x7F94,
			child_same_width = -0x7F93,
			child_same_height = -0x7F92,
			image_scale_x = -0x7F91,
			image_scale_y = -0x7F90,
			dont_close_children = -0x7F8F,
			savable_menu = -0x7F8E,
			menu_is_docked = -0x7F8D,
			menu_is_home = -0x7F8C,
			menu_is_visible = -0x7F8B,
			move_home = -0x7F8A,
			move_abroad = -0x7F89,
			moved_x = -0x7F88,
			moved_y = -0x7F87,
			moved_width = -0x7F86,
			moved_height = -0x7F85,
			home_x = -0x7F84,
			home_y = -0x7F83,
			home_width = -0x7F82,
			home_height = -0x7F81,
			xbox_button_a = -0x7F80,
			xbox_button_b = -0x7F7F,
			xbox_button_x = -0x7F7E,
			xbox_button_y = -0x7F7D,
			xbox_button_left = -0x7F7C,
			xbox_button_right = -0x7F7B,
			xbox_button_black = -0x7F7A,
			xbox_button_white = -0x7F79,
			xbox_button_back = -0x7F78,
			xbox_button_start = -0x7F77,
			xbox_button_a_release = -0x7F76,
			xbox_button_b_release = -0x7F75,
			xbox_button_x_release = -0x7F74,
			xbox_button_y_release = -0x7F73,
			xbox_button_left_release = -0x7F72,
			xbox_button_right_release = -0x7F71,
			xbox_button_black_release = -0x7F70,
			xbox_button_white_release = -0x7F6F,
			xbox_button_back_release = -0x7F6E,
			xbox_button_start_release = -0x7F6D,
			xbox_left_stick_x = -0x7F6C,
			xbox_left_stick_y = -0x7F6B,
			xbox_right_stick_x = -0x7F6A,
			xbox_right_stick_y = -0x7F69,
			xbox_focus_change = -0x7F68,
			xbox_default_focus = -0x7F67,
			xbox_filter_focus = -0x7F66,
			xbox_menu_focus = -0x7F65,
			xbox_menu_focus_x = -0x7F64,
			xbox_menu_focus_y = -0x7F63,
			xbox_text_a = -0x7F62,
			xbox_text_b = -0x7F61,
			xbox_text_x = -0x7F60,
			xbox_text_y = -0x7F5F,
			xbox_text_left = -0x7F5E,
			xbox_text_right = -0x7F5D,
			xbox_text_black = -0x7F5C,
			xbox_text_white = -0x7F5B,
			xbox_text_back = -0x7F5A,
			xbox_text_start = -0x7F59,
			xbox_no_focus_frame = -0x7F58,
			xbox_page_up = -0x7F57,
			xbox_page_down = -0x7F56,
			xbox_page_left = -0x7F55,
			xbox_page_right = -0x7F54,
			leave_front = -0x7F53,
			become_front = -0x7F52,
			cursor_scale = -0x7F50,
			hide = -0x7F4F,
			show = -0x7F4E,
			repeat_keys = -0x7F4D,
			null = -0x7F4C,
			model = -0x7F4B,
			text = -0x7F4A,
			rect = -0x7F49,
			image = -0x7F48,
			layout = -0x7F47,
			max = -0x7F46,
			min = -0x7F45,
			automatic = -0x7F44,			// named 'auto' in engine
			boolean_true = -0x7F43,			// named 'true' in engine
			boolean_false = -0x7F42,		// named 'false' in engine
			partial = -0x7F41,
			absolute = -0x7F40,
			left = -0x7F3F,
			center = -0x7F3E,
			right = -0x7F3D,
			show_2 = -0x7F3C,
			hide_2 = -0x7F3B,
			remove = -0x7F3A,
			nif_model = -0x7F38,
			text_model = -0x7F37,
			rect_model = -0x7F36,
			left_to_right = -0x7F35,
			top_to_bottom = -0x7F34,
			inherit = -0x7F33,
			use_family = -0x7F32,
			black_color = -0x7F31,
			white_color = -0x7F30,
			normal_color = -0x7F2F,
			normal_over_color = -0x7F2E,
			normal_pressed_color = -0x7F2D,
			active_color = -0x7F2C,
			active_over_color = -0x7F2B,
			active_pressed_color = -0x7F2A,
			disabled_color = -0x7F29,
			disabled_over_color = -0x7F28,
			disabled_pressed_color = -0x7F27,
			link_color = -0x7F26,
			link_over_color = -0x7F25,
			link_pressed_color = -0x7F24,
			journal_link_color = -0x7F23,
			journal_link_over_color = -0x7F22,
			journal_link_pressed_color = -0x7F21,
			journal_topic_color = -0x7F20,
			journal_topic_over_color = -0x7F1F,
			journal_topic_pressed_color = -0x7F1E,
			journal_finished_quest_color = -0x7F1D,
			journal_finished_quest_over_color = -0x7F1C,
			journal_finished_quest_pressed_color = -0x7F1B,
			answer_color = -0x7F1A,
			answer_over_color = -0x7F19,
			answer_pressed_color = -0x7F18,
			header_color = -0x7F17,
			notify_color = -0x7F16,
			big_normal_color = -0x7F15,
			big_normal_over_color = -0x7F14,
			big_normal_pressed_color = -0x7F13,
			big_link_color = -0x7F12,
			big_link_over_color = -0x7F11,
			big_link_pressed_color = -0x7F10,
			big_answer_color = -0x7F0F,
			big_answer_over_color = -0x7F0E,
			big_answer_pressed_color = -0x7F0D,
			big_header_color = -0x7F0C,
			big_notify_color = -0x7F0B,
			background_color = -0x7F0A,
			focus_color = -0x7F09,
			health_npc_color = -0x7F08,
			health_color = -0x7F07,
			magic_color = -0x7F06,
			fatigue_color = -0x7F05,
			misc_color = -0x7F04,
			weapon_fill_color = -0x7F03,
			magic_fill_color = -0x7F02,
			positive_color = -0x7F01,
			negative_color = -0x7F00,
			count_color = -0x7EFF,
			MapRelated_8102 = -0x7EFE,		// unknown label in engine
			MapRelated_8103 = -0x7EFD,		// unknown label in engine
			HelpMenu = -0x7EFB,
			CursorIcon = -0x7EFA,
			FocusIcon = -0x7EF9
		};

		typedef bool (__cdecl *EventCallback)(Element*, Property, int, int, Element*);
		typedef void (__cdecl *PropertyAccessCallback)(Property, int, PropertyType);

		union PropertyValue {
			int integerValue;
			float floatValue;
			void * ptrValue;
			Property propertyValue;
			EventCallback eventCallback;
			PropertyAccessCallback propertyCallback;

			PropertyValue() { integerValue = 0; }
		};

	}
}