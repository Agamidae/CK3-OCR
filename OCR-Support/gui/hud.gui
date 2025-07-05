######################################################
#################### META INFO #######################
######################################################

widget = {
	size = { 100% 100% }
	name = "meta_info"
	visible = "[And(IsDefaultGUIMode, Is('ocr'))]"
	layer = bottom

	window_sorcery = {}

	using = Animation_ShowHide_Standard

	flowcontainer = {
		name = "observer_status"
		visible = "[IsObserver]"
		visible_at_creation = no
		parentanchor = bottom|left
		position = { 240 -50 }
		ignoreinvisible = yes

		background = {
			using = Background_Area_Dark
		}

		text_single = {
			name = "global_observer_indication"
			visible = "[Not(GetPlayer.IsValid)]"
			text = "GLOBAL_OBSERVER"
		}

		text_single = {
			name = "player_observer_indication"
			visible = "[GetPlayer.IsValid]"
			text = "PLAYER_OBSERVER"
		}

		button_cancel = {
			name = "cancel_button"
			visible = "[GetPlayer.IsValid]"

			size = { 30 30 }
			onclick = "[ClearObserver]"
			tooltip = "OBSERVER_MODE_ON"
		}

		icon_observer = {
			size = { 30 30 }
			visible = "[Not(GetPlayer.IsValid)]"
		}
	}

	# ## Build version
	# text_single = {
	# 	name = "build_version_text"
	# 	position = { 5 5 }
	# 	visible = "[And( Not(IsGameViewOpen('barbershop')), Not(ReleaseMode))]"
	#
	# 	tooltip = "[GetBuildVersionDescription]"
	#
	# 	text = "VERSION_SHORT"
	# 	default_format = "#low"
	# 	max_width = 300
	# }


	error_horse = {
		parentanchor = bottom|left
		position = { 610 -10 }
		visible = "[And( Not(IsGameViewOpen('barbershop')), And( Not( IsPauseMenuShown ), Not(ReleaseMode) ) )]"
	}
	loaded_mods_icon = {
		parentanchor = bottom|left
		visible = "[And( Not( IsPauseMenuShown ), And( HasLoadedMods, Not(ReleaseMode) ) )]"
		tooltip = "[GetLoadedMods]"
		position = { 670 -5 }
	}

}

widget = {
	name = "ingame_topbar"
	visible = "[InGameTopbar.ShouldBeVisible]"
	size = { 100% 100% }
	layer = top

	flowcontainer = {
		ignoreinvisible = yes
		direction = vertical
		position = { 50 150 }
		background = { using = Background_Area_Border_Solid }
		visible = no

	}

	# test stuff
	flowcontainer = {
		ignoreinvisible = yes
		spacing = 5
		parentanchor = bottom
		visible = no#"[Not(InReleaseMode)]"

		button_text = {
			shortcut = speed_1
			blockoverride "text" {
				raw_text = "1"
			}
			clicksound = "event:/siege_started"
		}


		button_text = {
			shortcut = speed_2
			blockoverride "text" {
				raw_text = "2"
			}
			clicksound = "event:/breach_02"
		}

		button_text = {
			shortcut = speed_3
			blockoverride "text" {
				raw_text = "3"
			}

			# clicksound = "event:/money_out_ocr"
			clicksound = "event:/sfx_ui_message_theme_negative"
		}
		#
		# spacer = {}
		#
		#
		button_text = {
			shortcut = speed_4
			blockoverride "text" {
				raw_text = "4"
			}
			# clicksound = "event:/SFX/UI/breach_ui"
			# clicksound = "event:/SFX/UI/Generic/sfx_ui_generic_decrement"
			 clicksound = "event:/SFX/UI/Notifications/Messages/sfx_ui_message_theme_negative"

		}
		#
		button_text = {
			shortcut = speed_5
			blockoverride "text" {
				raw_text = "5"
			}
			# clicksound = "event:/SFX/UI/Actions/breach_action"
		}

		button_text = {
			shortcut = decrease_speed_2
			blockoverride "text" {
				raw_text = "Z"
			}
			# clicksound = "event:/SFX/breach_sfx"
		}
		#
		# button_text = {
		# 	blockoverride "text" {
		# 		raw_text = "flip ff"
		# 	}
		# 	using = paper_flip_forward_ocr
		# }
		#
		# button_text = {
		# 	blockoverride "text" {
		# 		raw_text = "flip back"
		# 	}
		# 	using = paper_flip_back_ocr
		# }
	}

	# tick sounds
	widget = {
		visible = "[GetPlayer.IsValid]"

		# daily sound
		widget = {
			visible = "[GetScriptedGui('daily_sound').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"

			widget = {
				visible = "[And(Not(GetPlayer.MakeScope.Var('daily_sound_loud').IsSet), Not(GetPlayer.MakeScope.Var('daily_sound_medium').IsSet))]"
				state = {
					name = daily_tick
					start_sound = {
						# soundeffect = "event:/daily_tick_ocr"
						soundeffect = "event:/SFX/UI/Generic/sfx_ui_generic_pointer_over"
					}
				}
			}

			widget = {
				visible = "[GetPlayer.MakeScope.Var('daily_sound_medium').IsSet]"
				state = {
					name = daily_tick
					start_sound = {
						soundeffect = "event:/daily_tick_ocr"
						# soundeffect = "event:/SFX/UI/Generic/sfx_ui_generic_pointer_over"
					}
				}
			}

			widget = {
				visible = "[GetPlayer.MakeScope.Var('daily_sound_loud').IsSet]"
				state = {
					name = daily_tick
					start_sound = {
						soundeffect = "event:/SFX/UI/Generic/sfx_ui_generic_decrement"
					}
				}
			}
		}

		# monthly sound
		widget = {
			visible = "[GetScriptedGui('monthly_sound').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"

			widget = {
				visible = "[Not(GetPlayer.MakeScope.Var('monthly_sound_confirm').IsSet)]"
				widget = {
					visible = "[GreaterThan_CFixedPoint(GetPlayer.GetBalance, '(CFixedPoint)0')]"
					state = {
						name = monthly_tick
						start_sound = {
							# soundeffect = "event:/SFX/UI/Character/Lifestyle/sfx_ui_character_lifestyle_stewardship_lifestyle"
							# soundeffect = "event:/SFX/UI/Generic/sfx_ui_generic_confirm"
							soundeffect = "event:/money_in_ocr"
						}
					}
				}
				widget = {
					visible = "[Not(GreaterThan_CFixedPoint(GetPlayer.GetBalance, '(CFixedPoint)0'))]"
					state = {
						name = monthly_tick
						start_sound = {
							soundeffect = "event:/money_out_ocr"
						}
					}
				}
			}

			widget = {
				visible = "[GetPlayer.MakeScope.Var('monthly_sound_confirm').IsSet]"
				state = {
					name = monthly_tick
					start_sound = {
						# soundeffect = "event:/SFX/UI/Character/Lifestyle/sfx_ui_character_lifestyle_stewardship_lifestyle"
						soundeffect = "event:/SFX/UI/Generic/sfx_ui_generic_confirm"
					}
				}
			}
		}
	}


	### Alerts
	notifications_alerts = {
		visible = "[And(And( Not(IsGameViewOpen('barbershop')), Not( IsPauseMenuShown ) ), Is('ocr'))]"
		parentanchor = top|right
		position = { -680 0 }

		using = Animation_ShowHide_Quick
	}

	### Alerts
	flowcontainer = {
		direction = vertical
		visible = "[And(And(And(And(And(Not( IsPauseMenuShown ), Not(IsLeftWindowOpen)), Not(IsBottomLeftWindowOpen)), Not(SinglePlayerShowingPausedSuccession)), Not(IsFullScreenWindowOpen)), Isnt('ocr'))]"
		ignoreinvisible = yes
		position = { 5 0 }
		spacing = 20

		notifications_alerts_ocr = {
			spacing = 10
		}
	}

	# suggestions
	widget = {
		size = { 100% 100% }
		alwaystransparent = yes
		# parentanchor = right
		widgetid = "suggestions_placer"
	}

	# error_button = {
	# 	position = { 10 35 }
	# 	visible = "[And(Is('ocr'), Not(ReleaseMode))]"
	# 	background = { using = Background_Area_Border_Solid }
	# }

	# mini alerts
	container = {
		# using = NoWindowsOpen
		background = { using = Background_Area_Border_Solid }
		position = { 15 0 }
		ignoreinvisible = yes
		visible = "[And(Isnt('royal_court_screenshot_window'), Isnt('ocr'))]"

		container = {
			visible = "[Isnt('suggestions')]"
			ignoreinvisible = yes
			background = {
				using = Background_Area_Border_Solid
				margin = { 5 0 }
			}

			button_text = {
				visible = "[And(Not(GetVariableSystem.Exists('hide_alerts')), Or(DataModelHasItems(InGameTopbar.GetAlertItems), DataModelHasItems(InGameTopbar.GetDiplomaticItems)))]"
				blockoverride "text" {
					raw_text = "[Add_int32(GetDataModelSize(InGameTopbar.GetAlertItems), GetDataModelSize(InGameTopbar.GetDiplomaticItems))] alerts, Shift A."
				}
				blockoverride "extra" {
					flowcontainer = {
						ignoreinvisible = yes
						visible = "[DataModelHasItems(InGameTopbar.GetDiplomaticItems)]"

						datamodel = "[DataModelLast(InGameTopbar.GetDiplomaticItems, '(int32)1')]"

						item = {
							button = {
								scissor = yes
								size = { 500 25 }
								onclick = "[DiplomaticItem.OnClick]"
								onrightclick = "[DiplomaticItem.OnRightClick]"
								button_ignore = none

								text_single = {
									raw_text = "DIPLOMATIC_ITEM_TOOLTIP"
									max_width = 500
									alwaystransparent = yes
									tooltip = "DIPLOMATIC_ITEM_TOOLTIP"
								}
							}
						}

					}
					flowcontainer = {
						ignoreinvisible = yes
						visible = "[And(IsDataModelEmpty(InGameTopbar.GetDiplomaticItems), DataModelHasItems(InGameTopbar.GetAlertItems))]"

						datamodel = "[DataModelLast(InGameTopbar.GetAlertItems, '(int32)1')]"

						item = {
							button = {
								scissor = yes
								size = { 500 25 }
								onclick = "[GUIAlertItem.OnClick]"
								onclick = "[Clear('hide_tutorial')]"
								onrightclick = "[GUIAlertItem.OnRightClick]"
								button_ignore = none

								text_single = {
									raw_text = "[GUIAlertItem.GetTooltip]"
									max_width = 500
									alwaystransparent = yes
									tooltip = "[GUIAlertItem.GetTooltip]"
								}
							}
						}

					}
				}
				onclick = "[GetVariableSystem.Toggle('hide_alerts')]"
			}
		}
	}

	flowcontainer = {
		visible = "[Is('combat_prediction_header')]"
		background = { using = Background_Area_Border_Solid }
		position = { 0 30 }
		margin_left = 15
		spacing = 3
		text_single = {
			raw_text = "[Get('combat_prediction_header')],"
		}
		text_single = {
			raw_text = "[Get('combat_prediction_text')]."
		}
	}

	# widget = {
	# 	size = { 600 28 }
	# 	background = { using = Background_Area_Border_Solid }
	# 	position = { 0 30 }
	# 	scissor = yes
	# 	visible = "[And(Is('combat_prediction_header'), IsGameViewOpen('army'))]"
	# }


	# hotkey for updates?
	button = {
		visible = "[Is('updates')]"
		onclick = "[GetVariableSystem.Toggle('show_feed')]"
		shortcut = go_back_2
	}

	######################################################
	#################### TOP RIGHT #######################
	######################################################

	### Top Right Bar
	vbox = {
		layoutpolicy_horizontal = expanding
		using = vanilla

		hbox = {
			layoutpolicy_horizontal = expanding
			expand = {}

			resources_top_right_bar = {
				name = "top_bar"
			}

		}

		expand = {}
	}

	### Outliner Button
	container = {
		visible = "[And(And( Not( IsPauseMenuShown ), And(Not(IsRightWindowOpen), IsDefaultGUIMode)), Not(IsFullScreenWindowOpen))]"
		parentanchor = top|right
		position = { -3 55 }

		using = Animation_ShowHide_Quick

		button = {
			name = "outliner_button"
			size = { 0 0 }
			alpha = 0.7
			visible = "[And(And(And(And(Not(IsGameViewOpen('activity_window')), Not(Has('county_tabs', 'tasks'))), Not(Is('extra_window'))), Not(IsGameViewOpen('title_view_window'))), Isnt('activity_view'))]"
			shortcut = "mapmode_empires_secondary"

			onclick = "[CloseGameView('holding_view')]"
			onclick = "[CloseGameView('army')]"
			onclick = "[ToggleGameView('outliner')]"
			tooltip = "TOGGLE_OUTLINER"

			state = {
				name = _mouse_enter
				alpha = 1
				duration = 0.2
				using = Animation_Curve_Default
			}

			state = {
				name = _mouse_leave
				alpha = 0.7
				duration = 0.7
				using = Animation_Curve_Default
			}
		}

		button_round = {
			visible = "[GetVariableSystem.Exists('ocr')]"
			size = { 35 35 }
			alpha = 0.7
			shortcut = "mapmode_empires_secondary"

			onclick = "[ToggleGameView('outliner')]"
			tooltip = "TOGGLE_OUTLINER"

			state = {
				name = _mouse_enter
				alpha = 1
				duration = 0.2
				using = Animation_Curve_Default
			}

			state = {
				name = _mouse_leave
				alpha = 0.7
				duration = 0.7
				using = Animation_Curve_Default
			}

			button_outliner = {
				parentanchor = center
				alwaystransparent = yes
				size = { 25 25 }
			}
		}
	}

	# vanilla buttons
	widget = {
		name = "main_tabs"
		visible = "[And(And(And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode)), Not(IsGameViewOpen('struggle'))), Is('ocr'))]"
		parentanchor = top|right
		position = { 0 105 }
		size = { 50 0 }
		allow_outside = yes

		using = Animation_ShowHide_Quick

		vbox = {
			alwaystransparent = no
			filter_mouse = all
			visible = "[Not(IsGameViewOpen('barbershop'))]"
			margin = { 5 10 }

			Background = {
				visible = "[And(Not(IsRightWindowOpen) , Not(IsGameViewOpen('barbershop')) )]"
				texture = "gfx/interface/skinned/hud_maintab_bg_middle.dds"
				spriteType = CorneredTiled
				texture_density =  2
				margin = { 0 -50 }
			}

			Background = {
				visible = "[And(Not(IsRightWindowOpen) , Not(IsGameViewOpen('barbershop')) )]"
				spriteType = CorneredStretched
				spriteborder_top = 100
				parentanchor = top|right
				texture_density = 2
				size = { 50 100 }
				texture = "gfx/interface/skinned/hud_maintab_bg_top.dds"
			}

			Background = {
				visible = "[And(Not(IsRightWindowOpen) , Not(IsGameViewOpen('barbershop')) )]"
				spriteType = CorneredStretched
				spriteborder_bottom = 100
				parentanchor = top|right
				texture_density = 2
				size = { 50 100 }
				texture = "gfx/interface/skinned/hud_maintab_bg_bottom.dds"
			}

			vbox = {
				state = {
					name = _show
					alpha = 1
					duration = 0.1
					using = Animation_Curve_Default
				}

				state = {
					name = _hide
					duration = 0.6
					alpha = 0
					using = Animation_Curve_Default
				}

				widget_hud_main_tab = {
					name = "tab_my_realm_tutorial_uses_this"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_my_realm.dds"
						onclick = "[ToggleGameView('my_realm')]"
						shortcut = "my_realm_window"
						tooltip = "MY_REALM_BUTTON"
						down = "[IsGameViewOpen('my_realm')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_military_tutorial_uses_this"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_military.dds"

						onclick = "[ToggleGameViewData('military', GetPlayer.GetID)]"
						shortcut = "military_window"
						tooltip = "MILITARY_BUTTON"
						down = "[IsGameViewOpen('military')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_council"
					visible = "[Not( IsLandlessAdventurer( GetPlayer ) )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_council.dds"

						onclick = "[ToggleGameViewData('council_window', GetPlayer.GetID)]"
						shortcut = "council_window"
						tooltip = "COUNCIL_BUTTON"
						down = "[IsGameViewOpen('council_window')]"
					}
				}
			}

			widget = {
				layoutpolicy_horizontal = expanding
				size = { 0 15 }

				icon = {
					visible = "[And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode))]"
					parentanchor = right|vcenter
					texture = "gfx/interface/skinned/hud_spike_big.dds"
					size = { 25 15 }

					using = Animation_ShowHide_Standard
				}
			}

			vbox = {
				widget_hud_main_tab = {
					name = "tab_court_tutorial_uses_this"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_court.dds"

						onclick = "[ToggleGameViewData( 'court_window', GetPlayer.GetID )]"
						shortcut = "court_window"
						tooltip = "COURT_BUTTON"
						down = "[IsGameViewOpen( 'court_window' )]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_intrigue"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_intrigue.dds"

						onclick = "[ToggleGameViewData('intrigue_window', GetPlayer.GetID)]"
						shortcut = "intrigue_window"
						tooltip = "INTRIGUE_BUTTON"
						down = "[IsGameViewOpen('intrigue_window')]"
					}

				}

				widget_hud_main_tab = {
					name = "tab_factions"
					visible = "[Or( Not( IsLandlessAdventurer( GetPlayer ) ), GetPlayer.IsInAFaction)]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_factions.dds"

						onclick = "[ToggleGameView('factions_window')]"
						shortcut = "factions_window"
						tooltip = "FACTION_BUTTON"
						down = "[IsGameViewOpen('factions_window')]"
					}
				}
			}

			widget = {
				layoutpolicy_horizontal = expanding
				size = { 0 15 }

				icon = {
					visible = "[And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode))]"
					parentanchor = right|vcenter
					texture = "gfx/interface/skinned/hud_spike_big.dds"
					size = { 25 15 }

					using = Animation_ShowHide_Standard
				}
			}

			vbox = {
				widget_hud_main_tab = {
					name = "tab_decisions"
					visible = "[Not(GetPlayer.GetGovernment.IsType( 'landless_adventurer_government' ))]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_decisions.dds"

						onclick = "[ToggleGameView('decisions')]"
						shortcut = "decision_window"
						tooltip = "DECISIONS_BUTTON_CONTAINER"
						down = "[IsGameViewOpen('decisions')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_contracts"
					visible = "[GetPlayer.GetGovernment.IsType( 'landless_adventurer_government' )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_contracts.dds"

						onclick = "[ToggleGameView('decisions')]"
						shortcut = "decision_window"
						tooltip = "DECISIONS_BUTTON_CONTAINER"
						down = "[IsGameViewOpen('decisions')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_activities"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_activities.dds"

						onclick = "[ToggleGameView('activity_list_window')]"
						shortcut = "activity_list_window"
						tooltip = "ACTIVITY_LIST_BUTTON"
						down = "[IsGameViewOpen('activity_list_window')]"
					}
				}

				widget_hud_main_tab = {
					datacontext = "[GetPlayer]"
					datacontext = "[AccessLocalPlayerCachedData]"
					datacontext = "[LocalPlayerCachedData.AccessNewArtifacts]"
					datacontext = "[LocalPlayerCachedData.AccessCourtEvents]"
					datacontext = "[Character.GetCourtGrandeurData]"
					visible = "[And(And( And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode)), HasDlcFeature( 'court_room_view' )), Not( IsLandlessAdventurer( GetPlayer ) ))]"
					enabled = "[Character.HasRoyalCourt]"

					allow_outside = yes
					name = "royal_court_button_tutorial_uses_this"

					tooltipwidget = {
						container_royal_court_tooltip = {}
					}

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_courtview.dds"
						onclick = "[Character.OpenRoyalCourtView( 'throne' )]"

						# Looping glow when you have unhandled court events or first get your royal court
						using = Animation_Glow_Pulse

						glow = {
							glow_radius = 8
							using = Glow_Standard
							using = Color_Bright_Yellow
							visible = "[Or( And( Character.HasRoyalCourt, Not( LocalPlayerCachedData.HasEverOpenedRoyalCourt ) ), GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' ) )]"
						}

						# Pulse when you get a new pending court event
						state = {
							name = "pending_court_event_start"
							next = "pending_court_event_a"
							position_x = 0
							duration = 0.2
							size = { 45 45 }
							using = Animation_Curve_Default
							trigger_when = "[GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' )]"

							start_sound = {
								soundeffect = "event:/DLC/EP1/SFX/UI/Notifications/royal_court_event_available"
							}
						}

						state = {
							name = "pending_court_event_a"
							next = "pending_court_event_b"
							position_x = -30
							duration = 0.45
							size = { 85 85 }
							using = Animation_Curve_Default
						}

						state = {
							name = "pending_court_event_b"
							position_x = 0
							duration = 0.25
							size = { 45 45 }
							bezier = { 0.43 0 0.2 2.2 }
						}

						flowcontainer = {
							position = { -5 0 }
							direction = vertical
							ignoreinvisible = yes
							visible = "[Character.HasRoyalCourt]"
							datacontext = "[GetPlayer]"

							widget_royal_court_notification = {
								visible = "[And( GreaterThanOrEqualTo_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel ), Or( GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' ), '(int32)0' ), Or( GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' ), GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' ) ) ) )]"
							}

							widget_below_cgv_expectations = {
								visible = "[LessThan_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel )]"
							}
						}
					}
				}

				widget_hud_main_tab = {
					name = "tab_tax_jurisdiction"
					datacontext = "[GetPlayer]"
					enabled = "[Character.HasTaxSlots]"
					visible = "[Or( GetPlayer.GetGovernment.IsType( 'clan_government' ), Character.HasTaxSlots )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_tax_jurisdictions.dds"

						onclick = "[ToggleGameViewData('manage_tax_slots', GetPlayer.GetID)]"
						down = "[IsGameViewOpen('manage_tax_slots')]"

						using = tooltip_ws
						tooltipwidget = {
							tax_jurisdictions_button_tooltip = {}
						}

						icon = {
							size = { 100% 100% }
							visible = "[GreaterThan_int32( GetPlayer.GetUnassignedVassalsCount, '(int32)0' )]"
							texture = "gfx/interface/skinned/hud_maintab/maintab_tax_jurisdictions.dds"

							glow = {
								glow_radius = 8
								using = Glow_Standard
								using = Color_Red
							}
							state = {
								name = a
								next = b
								alpha = 0.3
								trigger_on_create = yes
								duration = 1.2
								using = Animation_Curve_Default
							}

							state = {
								name = b
								next = a
								alpha = 0.5
								duration = 0.6
								using = Animation_Curve_Default
							}
						}

						icon = {
							visible = "[Or( Or( GreaterThan_int32( Character.GetUnassignedVassalsCount, '(int32)0' ), Not( Character.HasTaxSlots ) ), GreaterThan_int32( Character.GetUntaxedJurisdictionCount, '(int32)0' ) )]"
							size = { 25 25 }
							position = { -5 5}
							texture = "gfx/interface/icons/symbols/icon_warning.dds"

							icon = {
								size = { 100% 100% }
								alwaystransparent = yes
								texture = "gfx/interface/icons/symbols/icon_warning.dds"

								modify_texture = {
									texture = "gfx/interface/icons/focuses/hud_icon_mask.dds"
									blend_mode = alphamultiply
								}

								modify_texture = {
									texture = "gfx/interface/colors/red.dds"
									blend_mode = colordodge
								}

								state = {
									name = a
									next = b
									alpha = 0
									trigger_on_create = yes
									duration = 1.2
									using = Animation_Curve_Default
								}

								state = {
									name = b
									next = a
									alpha = 0.8
									duration = 0.6
									using = Animation_Curve_Default
								}
							}
						}
					}
				}

				widget_hud_main_tab = {
					name = "tab_government_administration"
					visible = "[GetPlayer.GetTopLiege.GetGovernment.HasRule( 'administrative' )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_administrative.dds"

						onclick = "[ToggleGameView( 'government_administration' )]"
						down = "[IsGameViewOpen( 'government_administration' )]"

						using = tooltip_ws
						tooltipwidget = {
							administrative_button_tooltip = {}
						}
					}
				}
			}
		}

		# Invisible button to ensure that these shortcuts don't get hidden
		button = {
			size = { 0 0 }
			onclick = "[ToggleGameViewData( 'character', GetPlayer.GetID )]"
			shortcut = "character_window"
		}

		# widget = {
		# 	datacontext = "[GetPlayer]"
		# 	datacontext = "[AccessLocalPlayerCachedData]"
		# 	datacontext = "[LocalPlayerCachedData.AccessNewArtifacts]"
		# 	datacontext = "[LocalPlayerCachedData.AccessCourtEvents]"
		# 	datacontext = "[Character.GetCourtGrandeurData]"
		# 	visible = "[And( And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode)), HasDlcFeature( 'royal_court' ))]"
		# 	enabled = "[Character.HasRoyalCourt]"

		# 	parentanchor = bottom
		# 	position = { 4 50 }
		# 	size = { 45 45 }

		# 	icon = {
		# 		name = "royal_court_button_background"
		# 		visible = "[Not(IsRightWindowOpen)]"
		# 		size = { 45 45 }
		# 		texture = "gfx/interface/buttons/maintab_courtview_bg.dds"

		# 		allow_outside = yes

		# 		state = {
		# 			name = _show
		# 			alpha = 1
		# 			duration = 0.1
		# 			using = Animation_Curve_Default
		# 		}

		# 		state = {
		# 			name = _hide
		# 			duration = 0.6
		# 			alpha = 0
		# 			using = Animation_Curve_Default
		# 		}

		# 		state = {
		# 			name = "hud_tab_glow_courtview_enter"
		# 			duration = 0.03
		# 			using = Animation_Curve_Default

		# 			modify_texture = {
		# 				name = "glow_courtview"
		# 				alpha = 1
		# 			}
		# 		}

		# 		state = {
		# 			name = "hud_tab_glow_courtview_leave"
		# 			duration = 0.1
		# 			using = Animation_Curve_Default

		# 			modify_texture = {
		# 				name = "glow_courtview"
		# 				alpha = 0
		# 			}
		# 		}

		# 		modify_texture = {
		# 			name = "glow_courtview"
		# 			texture = "gfx/interface/buttons/maintab_courtview_bg_glow.dds"
		# 			alpha = 0
		# 		}
		# 	}

		# 	widget_hud_main_tab = {
		# 		allow_outside = yes
		# 		name = "royal_court_button_tutorial_uses_this"

		# 		tooltipwidget = {
		# 			container_royal_court_tooltip = {}
		# 		}

		# 		state = {
		# 			name = _mouse_hierarchy_enter
		# 			on_start = "[PdxGuiInterruptThenTriggerAllAnimations('hud_tab_glow_courtview_leave','hud_tab_glow_courtview_enter')]"
		# 			alpha = 1
		# 		}

		# 		state = {
		# 			name = _mouse_hierarchy_leave
		# 			on_start = "[PdxGuiInterruptThenTriggerAllAnimations('hud_tab_glow_courtview_enter','hud_tab_glow_courtview_leave')]"
		# 			alpha = 1
		# 		}

		# 		blockoverride "maintab_button"
		# 		{
		# 			texture = "gfx/interface/buttons/maintab_courtview.dds"
		# 			onclick = "[Character.OpenRoyalCourtView( 'throne' )]"

		# 			# Looping glow when you have unhandled court events or first get your royal court
		# 			using = Animation_Glow_Pulse

		# 			glow = {
		# 				glow_radius = 8
		# 				using = Glow_Standard
		# 				using = Color_Bright_Yellow
		# 				visible = "[Or( And( Character.HasRoyalCourt, Not( LocalPlayerCachedData.HasEverOpenedRoyalCourt ) ), GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' ) )]"
		# 			}

		# 			# Pulse when you get a new pending court event
		# 			state = {
		# 				name = "pending_court_event_start"
		# 				next = "pending_court_event_a"
		# 				position_x = 0
		# 				duration = 0.2
		# 				size = { 45 45 }
		# 				using = Animation_Curve_Default
		# 				trigger_when = "[GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' )]"

		# 				start_sound = {
		# 					soundeffect = "event:/DLC/EP1/SFX/UI/Notifications/royal_court_event_available"
		# 				}
		# 			}

		# 			state = {
		# 				name = "pending_court_event_a"
		# 				next = "pending_court_event_b"
		# 				position_x = -30
		# 				duration = 0.45
		# 				size = { 85 85 }
		# 				using = Animation_Curve_Default
		# 			}

		# 			state = {
		# 				name = "pending_court_event_b"
		# 				position_x = 0
		# 				duration = 0.25
		# 				size = { 45 45 }
		# 				bezier = { 0.43 0 0.2 2.2 }
		# 			}

		# 			flowcontainer = {
		# 				position = { 0 6 }
		# 				parentanchor = bottom|hcenter
		# 				widgetanchor = center
		# 				direction = vertical
		# 				ignoreinvisible = yes
		# 				visible = "[Character.HasRoyalCourt]"
		# 				datacontext = "[GetPlayer]"

		# 				widget_royal_court_notification = {
		# 					visible = "[And( GreaterThanOrEqualTo_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel ), Or( GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' ), '(int32)0' ), Or( GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' ), GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' ) ) ) )]"
		# 				}

		# 				widget_below_cgv_expectations = {
		# 					visible = "[LessThan_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel )]"
		# 				}
		# 			}
		# 		}
		# 	}
		# }
	}

	# text shortcuts list
	widget = {
		visible = "[And(And(And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode)), Not(IsGameViewOpen('struggle'))), Isnt('ocr'))]"
		parentanchor = top|right
		position = { 5 105 }
		size = { 50 390 }
		allow_outside = yes

		vbox = {
			alwaystransparent = no
			filter_mouse = all
			visible = "[And(Not(IsGameViewOpen('barbershop')),Is('ocr'))]"
			margin = { 5 10 }

			Background = {
				visible = "[And(Not(IsRightWindowOpen) , Not(IsGameViewOpen('barbershop')) )]"
				texture = "gfx/interface/skinned/hud_maintab_bg_middle.dds"
				spriteType = CorneredTiled
				texture_density =  2
				margin = { 0 -50 }
			}

			Background = {
				visible = "[And(Not(IsRightWindowOpen) , Not(IsGameViewOpen('barbershop')) )]"
				spriteType = CorneredStretched
				spriteborder_top = 100
				parentanchor = top|right
				texture_density = 2
				size = { 50 100 }
				texture = "gfx/interface/skinned/hud_maintab_bg_top.dds"
			}

			Background = {
				visible = "[And(Not(IsRightWindowOpen) , Not(IsGameViewOpen('barbershop')) )]"
				spriteType = CorneredStretched
				spriteborder_bottom = 100
				parentanchor = top|right
				texture_density = 2
				size = { 50 100 }
				texture = "gfx/interface/skinned/hud_maintab_bg_bottom.dds"
			}

			vbox = {
				state = {
					name = _show
					alpha = 1
					duration = 0.1
					using = Animation_Curve_Default
				}

				state = {
					name = _hide
					duration = 0.6
					alpha = 0
					using = Animation_Curve_Default
				}

				widget_hud_main_tab = {
					name = "tab_my_realm_tutorial_uses_this"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_my_realm.dds"
						onclick = "[ToggleGameView('my_realm')]"
						shortcut = "my_realm_window"
						tooltip = "MY_REALM_BUTTON"
						down = "[IsGameViewOpen('my_realm')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_military_tutorial_uses_this"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_military.dds"

						onclick = "[ToggleGameViewData('military', GetPlayer.GetID)]"
						shortcut = "military_window"
						tooltip = "MILITARY_BUTTON"
						down = "[IsGameViewOpen('military')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_council"
					visible = "[Not( IsLandlessAdventurer( GetPlayer ) )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_council.dds"

						onclick = "[ToggleGameViewData('council_window', GetPlayer.GetID)]"
						shortcut = "council_window"
						tooltip = "COUNCIL_BUTTON"
						down = "[IsGameViewOpen('council_window')]"
					}
				}
			}

			widget = {
				layoutpolicy_horizontal = expanding
				size = { 0 15 }

				icon = {
					visible = "[And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode))]"
					parentanchor = right|vcenter
					texture = "gfx/interface/skinned/hud_spike_big.dds"
					size = { 25 15 }

					using = Animation_ShowHide_Standard
				}
			}

			vbox = {
				widget_hud_main_tab = {
					name = "tab_court_tutorial_uses_this"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_court.dds"

						onclick = "[ToggleGameViewData( 'court_window', GetPlayer.GetID )]"
						shortcut = "court_window"
						tooltip = "COURT_BUTTON"
						down = "[IsGameViewOpen( 'court_window' )]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_intrigue"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_intrigue.dds"

						onclick = "[ToggleGameViewData('intrigue_window', GetPlayer.GetID)]"
						shortcut = "intrigue_window"
						tooltip = "INTRIGUE_BUTTON"
						down = "[IsGameViewOpen('intrigue_window')]"
					}

				}

				widget_hud_main_tab = {
					name = "tab_factions"
					visible = "[Or( Not( IsLandlessAdventurer( GetPlayer ) ), GetPlayer.IsInAFaction)]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_factions.dds"

						onclick = "[ToggleGameView('factions_window')]"
						shortcut = "factions_window"
						tooltip = "FACTION_BUTTON"
						down = "[IsGameViewOpen('factions_window')]"
					}
				}
			}

			widget = {
				layoutpolicy_horizontal = expanding
				size = { 0 15 }

				icon = {
					visible = "[And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode))]"
					parentanchor = right|vcenter
					texture = "gfx/interface/skinned/hud_spike_big.dds"
					size = { 25 15 }

					using = Animation_ShowHide_Standard
				}
			}

			vbox = {
				widget_hud_main_tab = {
					name = "tab_decisions"
					visible = "[Not(GetPlayer.GetGovernment.IsType( 'landless_adventurer_government' ))]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_decisions.dds"

						onclick = "[ToggleGameView('decisions')]"
						shortcut = "decision_window"
						tooltip = "DECISIONS_BUTTON_CONTAINER"
						down = "[IsGameViewOpen('decisions')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_contracts"
					visible = "[GetPlayer.GetGovernment.IsType( 'landless_adventurer_government' )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_contracts.dds"

						onclick = "[ToggleGameView('decisions')]"
						shortcut = "decision_window"
						tooltip = "DECISIONS_BUTTON_CONTAINER"
						down = "[IsGameViewOpen('decisions')]"
					}
				}

				widget_hud_main_tab = {
					name = "tab_activities"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_activities.dds"

						onclick = "[ToggleGameView('activity_list_window')]"
						shortcut = "activity_list_window"
						tooltip = "ACTIVITY_LIST_BUTTON"
						down = "[IsGameViewOpen('activity_list_window')]"
					}
				}

				widget_hud_main_tab = {
					datacontext = "[GetPlayer]"
					datacontext = "[AccessLocalPlayerCachedData]"
					datacontext = "[LocalPlayerCachedData.AccessNewArtifacts]"
					datacontext = "[LocalPlayerCachedData.AccessCourtEvents]"
					datacontext = "[Character.GetCourtGrandeurData]"
					visible = "[And(And( And( Not( IsPauseMenuShown ), And(Or(Not(IsObserver), GetPlayer.IsValid), IsDefaultGUIMode)), HasDlcFeature( 'court_room_view' )), Not( IsLandlessAdventurer( GetPlayer ) ))]"
					enabled = "[Character.HasRoyalCourt]"

					allow_outside = yes
					name = "royal_court_button_tutorial_uses_this"

					tooltipwidget = {
						container_royal_court_tooltip = {}
					}

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_courtview.dds"
						onclick = "[Character.OpenRoyalCourtView( 'throne' )]"

						# Looping glow when you have unhandled court events or first get your royal court
						using = Animation_Glow_Pulse

						glow = {
							glow_radius = 8
							using = Glow_Standard
							using = Color_Bright_Yellow
							visible = "[Or( And( Character.HasRoyalCourt, Not( LocalPlayerCachedData.HasEverOpenedRoyalCourt ) ), GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' ) )]"
						}

						# Pulse when you get a new pending court event
						state = {
							name = "pending_court_event_start"
							next = "pending_court_event_a"
							position_x = 0
							duration = 0.2
							size = { 45 45 }
							using = Animation_Curve_Default
							trigger_when = "[GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' )]"

							start_sound = {
								soundeffect = "event:/DLC/EP1/SFX/UI/Notifications/royal_court_event_available"
							}
						}

						state = {
							name = "pending_court_event_a"
							next = "pending_court_event_b"
							position_x = -30
							duration = 0.45
							size = { 85 85 }
							using = Animation_Curve_Default
						}

						state = {
							name = "pending_court_event_b"
							position_x = 0
							duration = 0.25
							size = { 45 45 }
							bezier = { 0.43 0 0.2 2.2 }
						}

						flowcontainer = {
							position = { -5 0 }
							direction = vertical
							ignoreinvisible = yes
							visible = "[Character.HasRoyalCourt]"
							datacontext = "[GetPlayer]"

							widget_royal_court_notification = {
								visible = "[And( GreaterThanOrEqualTo_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel ), Or( GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' ), '(int32)0' ), Or( GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' ), GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' ) ) ) )]"
							}

							widget_below_cgv_expectations = {
								visible = "[LessThan_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel )]"
							}
						}
					}
				}

				widget_hud_main_tab = {
					name = "tab_tax_jurisdiction"
					datacontext = "[GetPlayer]"
					enabled = "[Character.HasTaxSlots]"
					visible = "[Or( GetPlayer.GetGovernment.IsType( 'clan_government' ), Character.HasTaxSlots )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_tax_jurisdictions.dds"

						onclick = "[ToggleGameViewData('manage_tax_slots', GetPlayer.GetID)]"
						down = "[IsGameViewOpen('manage_tax_slots')]"

						using = tooltip_ws
						tooltipwidget = {
							tax_jurisdictions_button_tooltip = {}
						}

						icon = {
							size = { 100% 100% }
							visible = "[GreaterThan_int32( GetPlayer.GetUnassignedVassalsCount, '(int32)0' )]"
							texture = "gfx/interface/skinned/hud_maintab/maintab_tax_jurisdictions.dds"

							glow = {
								glow_radius = 8
								using = Glow_Standard
								using = Color_Red
							}
							state = {
								name = a
								next = b
								alpha = 0.3
								trigger_on_create = yes
								duration = 1.2
								using = Animation_Curve_Default
							}

							state = {
								name = b
								next = a
								alpha = 0.5
								duration = 0.6
								using = Animation_Curve_Default
							}
						}

						icon = {
							visible = "[Or( Or( GreaterThan_int32( Character.GetUnassignedVassalsCount, '(int32)0' ), Not( Character.HasTaxSlots ) ), GreaterThan_int32( Character.GetUntaxedJurisdictionCount, '(int32)0' ) )]"
							size = { 25 25 }
							position = { -5 5}
							texture = "gfx/interface/icons/symbols/icon_warning.dds"

							icon = {
								size = { 100% 100% }
								alwaystransparent = yes
								texture = "gfx/interface/icons/symbols/icon_warning.dds"

								modify_texture = {
									texture = "gfx/interface/icons/focuses/hud_icon_mask.dds"
									blend_mode = alphamultiply
								}

								modify_texture = {
									texture = "gfx/interface/colors/red.dds"
									blend_mode = colordodge
								}

								state = {
									name = a
									next = b
									alpha = 0
									trigger_on_create = yes
									duration = 1.2
									using = Animation_Curve_Default
								}

								state = {
									name = b
									next = a
									alpha = 0.8
									duration = 0.6
									using = Animation_Curve_Default
								}
							}
						}
					}
				}

				widget_hud_main_tab = {
					name = "tab_government_administration"
					visible = "[GetPlayer.GetTopLiege.GetGovernment.HasRule( 'administrative' )]"

					blockoverride "maintab_button"
					{
						texture = "gfx/interface/skinned/hud_maintab/maintab_administrative.dds"

						onclick = "[ToggleGameView( 'government_administration' )]"
						down = "[IsGameViewOpen( 'government_administration' )]"

						using = tooltip_ws
						tooltipwidget = {
							administrative_button_tooltip = {}
						}
					}
				}
			}
		}

		# Invisible button to ensure that these shortcuts don't get hidden
		button = {
			# visible = "[Not(IsGameViewOpen('character'))]"
			onclick = "[ToggleGameViewData( 'character', GetPlayer.GetID )]"
			# onclick = "[GetVariableSystem.Set('hide_right_windows', 'yes')]"
			# onclick = "[PdxGuiTriggerAllAnimations('clear_right')]"
			onclick = "[CloseGameView('my_realm')]"
			onclick = "[Clear('extra_window')]"
			visible = "[Not(IsPauseMenuShown)]"
			shortcut = "character_window"
		}
	}

	widget_stress_sounds = { }

	# resources ocr
	window = {
		# layer = debug
		movable = no
		using = TooltipFocus
		alwaystransparent = no
		size = { 0 0 }
		visible = "[GetVariableSystem.Exists('resources')]"

		# state = {
		# 	name = _show
		# 	on_finish = "[ExecuteConsoleCommand(Select_CString(Character.IsAdult, Character.GetKnightEffectivenessBreakdown, 'x'))]"
		# 	# on_finish = "[ExecuteConsoleCommand(AddTextIf(GetPlayer.IsAdult, 'gold 100'))]"
		# 	# on_start = "[GetVariableSystem.Set('opened', 'yes')]"
		# }

		# state = {
		# 	name = _hide
		# 	on_finish = "[GetVariableSystem.Clear('opened')]"
		# }
		#
		#
		# widget = {
		# 	visible = "[And(GetVariableSystem.Exists('opened'), GetPlayer.IsAdult)]"
		# 	state = {
		# 		name = _show
		# 		on_finish = "[ExecuteConsoleCommand('gold 100')]"
		# 	}
		# }

		vbox = {
			margin = { 15 10 }
			name = "spendables"
			resizeparent = yes
			background = { using = Background_Area_Border_Solid }
			# layoutpolicy_horizontal = expanding
			# layoutpolicy_vertical = expanding

			vbox = {
				name = "tutorial_highlight_resources_bar"
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding

				hbox = {
					name = "gold"
					layoutpolicy_vertical = expanding
					layoutpolicy_horizontal = expanding
					# minimumsize = { 90 0 }
					# margin_left = 7

					using = tooltip_ne

					tooltipwidget = {
						widget_gold_breakdown_tooltip = {
							blockoverride "my_gold" {
								flowcontainer = {
									# direction = vertical
									text_single = {
										raw_text = "Gold: [GetPlayer.GetGold|0]. Income"
									}
									widget = {
										size = { 5 0 }
									}
									text_single = {
										raw_text = "CURRENT_BALANCE"
									}
									text_single = {
										raw_text = "."
									}
								}
							}
							blockoverride "income"
							{
								datacontext = "[InGameTopbar.GetIncomeBalanceBreakdown]"
							}

							blockoverride "expenses"
							{
								datacontext = "[InGameTopbar.GetExpensesBalanceBreakdown]"
							}
						}
					}

					hbox = {
						name = "gold"
						layoutpolicy_vertical = expanding

						hbox = {
							spacing = 3

							text_single = {
								raw_text = "Gold:"
							}

							flowcontainer = {
								spacing = 6
								ignoreinvisible = yes

								text_single = {
									name = "gold_value_positive"
									raw_text = "[GetPlayer.GetGold|0],"
									max_width = 50
								}

								flowcontainer = {
									text_single = {
										name = "balance_positive"
										text = "CURRENT_BALANCE"
										max_width = 50
									}
									text_single = {
										raw_text = " per month."
									}
								}
							}
						}
					}
					expand = { }
				}

				hbox = {
					name = "provisions"
					layoutpolicy_horizontal = expanding
					visible = "[IsLandlessAdventurer( GetPlayer )]"
					datacontext = "[GetPlayer.GetDomicile]"
					tooltip = "[Domicile.GetProvisionsBreakdown]"

					button_gather_provisions = {
						onclick = "[Clear('resources')]"
					}

					expand = {}
				}

				#TODO influence levels
				hbox = {
					layoutpolicy_horizontal = expanding
					datacontext = "[InGameTopbar.GetInfluenceItem]"
					name = "influence"
					visible = "[GetPlayer.GetGovernment.HasRule( 'administrative' )]"

					text_single = {
						raw_text = "Influence: [GetPlayer.GetInfluence|0],"
					}
					text_single = {
						raw_text = "[PlayerValueItem.GetBalance|1=]."
					}

					text_single = {
						raw_text = "[PlayerValueItem.GetCurrentLevelName],"
					}

					text_single = {
						visible = "[PlayerValueItem.HasNextLevel]"
						raw_text = " [PlayerValueItem.GetProgressTooltip]."
					}

					tooltipwidget = {
						widget_resource_value_tooltip = {}
					}
					expand = {}
				}

				button = {
					datacontext = "[GetPlayer]"
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					visible = "[GreaterThan_int32( Character.GetDomainSize, Character.GetDomainLimit )]"

					minimumsize = { 60 0 }

					margin_left = 3

					tooltip = "[Character.GetDomainLimitTooltip]"
					using = tooltip_ne

					onclick = "[ToggleGameView('my_realm')]"
					onclick = "[Clear('resources')]"


					flowcontainer = {
						resizeparent = yes
						spacing = 5
						text_single = {
							raw_text = "Warning, Domain"
						}

						text_single = {
							name = "value"
							raw_text = "[Character.GetDomainSize] out of [Character.GetDomainLimit]."
						}
					}
				}

				hbox = {
					name = "prestige"
					datacontext = "[InGameTopbar.GetPrestigeItem]"
					layoutpolicy_vertical = expanding
					layoutpolicy_horizontal = expanding

					using = tooltip_ne

					datacontext = "[PlayerValueItem.GetBalanceGained]"
					tooltipwidget = {
						widget_value_breakdown_tooltip = {
							blockoverride "header" {
								text_single = {
									layoutpolicy_horizontal = expanding
									raw_text = "Prestige gain:"
								}
							}
						}
					}

					#TODO remove progress form localization instead of this weird scissoring

					flowcontainer = {
						spacing = 3
						text_single = {
							raw_text = "Prestige:"
						}

						text_single = {
							name = "prestige_value"
							raw_text = "[GetPlayer.GetPrestige|0],"
						}

						container_resource_balance = { }

						text_single = {
							raw_text = "[GetPrestigeLevelName(GetPlayer.GetPrestigeLevel)],"
							tooltipwidget = {
								widget_resource_value_tooltip = { }
							}
						}
					}

					text_single = {
						visible = "[PlayerValueItem.HasNextLevel]"
						tooltipwidget = {
							widget_resource_value_tooltip = { }
						}
						datacontext = "[InGameTopbar.GetPrestigeItem]"
						raw_text = " [PlayerValueItem.GetProgressTooltip]."
					}

					expand = { }
				}

				button = {
					layoutpolicy_horizontal = expanding
					name = "piety"
					datacontext = "[InGameTopbar.GetPietyItem]"
					onclick = "[OpenGameViewData( 'faith', GetPlayer.GetFaith.GetID )]"
					onclick = "[Clear('resources')]"

					using = tooltip_ne

					datacontext = "[PlayerValueItem.GetBalanceGained]"
					tooltipwidget = {
						widget_value_breakdown_tooltip = {
							blockoverride "header" {
								text_single = {
									layoutpolicy_horizontal = expanding
									raw_text = "Piety gain:"
								}
							}
						}
					}

					flowcontainer = {
						ignoreinvisible = yes
						resizeparent = yes
						spacing = 3
						text_single = {
							raw_text = "Piety:"
						}

						text_single = {
							name = "piety_value"
							raw_text = "[GetPlayer.GetPiety|0],"
						}

						container_resource_balance = { }


						text_single = {
							raw_text = "[GetPietyLevelName(GetPlayer.GetPietyLevel)],"
						}

						text_single = {
							visible = "[PlayerValueItem.HasNextLevel]"
							datacontext = "[InGameTopbar.GetPietyItem]"
							raw_text = "[PlayerValueItem.GetProgressTooltip]."
						}
					}
				}

				button_text = {
					layoutpolicy_horizontal = expanding
					name = "legitimacy_button"
					visible = "[And(LegitimacyType.IsValid, Character.GetGovernment.HasRule( 'legitimacy' ))]"
					datacontext = "[GetPlayer]"
					datacontext = "[Character.GetLegitimacyType]"
					datacontext = "[Character.GetLegitimacyLevel]"

					tooltipwidget = {
						legitimacy_hud_tooltip_ocr = {
							datacontext = "[InGameBottomBar.GetLegitimacyBar]"
						}
					}

					blockoverride "extra" {
						margin_left = -3
						text_single = {
							raw_text = "Legitimacy"
						}
						text_single = {
							raw_text = "level [LegitimacyLevel.GetIndex]," #TODO
						}
						text_single = {
							raw_text = "and [Character.GetAverageVassalLegitimacyExpectation.GetIndex] is expected."
						}
						# text_single = {
						# 	raw_text = "and [Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex] for powerful vassals."
						# }
						text_single = {
							raw_text = "[Character.GetLegitimacy|V^] out of [LegitimacyType.GetMaxLegitimacy( Character.Self )|V^] points"
						}

						dot_l = {}
					}
				}

				button = {
					layoutpolicy_horizontal = expanding
					name = "renown"
					datacontext = "[InGameTopbar.GetDynastyPrestigeItem]"
					datacontext = "[PlayerValueItem.GetBalanceGained]"

					onclick = "[DefaultOnHouseCoatOfArmsClick(GetPlayer.GetHouse.GetID)]"
					onclick = "[Clear('resources')]"

					using = tooltip_ne

					tooltipwidget = {
						widget_value_breakdown_tooltip = {
							blockoverride "header" {
								text_single = {
									layoutpolicy_horizontal = expanding
									raw_text = "Renown gain:"
								}
							}
						}
					}

					flowcontainer = {
						resizeparent = yes
						ignoreinvisible = yes
						spacing = 3

						text_single = {
							raw_text = "Renown:"
						}

						flowcontainer = {
							visible = "[GetPlayer.IsDynast]"
							spacing = 3

							text_single = {
								name = "prestige_value"
								raw_text = "[GetPlayer.GetDynasty.GetPrestige|0],"
							}

							# container_resource_balance = { }
						}

						flowcontainer = {
							visible = "[Not(GetPlayer.IsDynast)]"
							spacing = 3

							text_single = {
								name = "prestige_value_nodynast"
								raw_text = "[GetPlayer.GetDynasty.GetPrestige|0],"
							}

							# container_resource_balance = { }
						}

						widget = {
							scissor = yes
							visible = "[ValueBreakdown.ShouldShowValue]"

							text_single = {
								resizeparent = yes
								margin_left = -56
								name = "gained_value"
								raw_text = "[ValueBreakdown.GetValue]."
							}
						}


						widget = {
							scissor = yes
							visible = "[Or(EqualTo_int32(GetPlayer.GetDynasty.GetPrestigeLevel, '(int32)2'), EqualTo_int32(GetPlayer.GetDynasty.GetPrestigeLevel, '(int32)3'))]"

							text_single = {
								raw_text = " [GetDynastyPrestigeLevelName(GetPlayer.GetDynasty.GetPrestigeLevel)],"
							}
						}

						text_single = {
							visible = "[Not(Or(EqualTo_int32(GetPlayer.GetDynasty.GetPrestigeLevel, '(int32)2'), EqualTo_int32(GetPlayer.GetDynasty.GetPrestigeLevel, '(int32)3')))]"
							raw_text = "[GetDynastyPrestigeLevelName(GetPlayer.GetDynasty.GetPrestigeLevel)],"
						}

						text_single = {
							tooltipwidget = {
								widget_resource_value_tooltip = { }
							}
							visible = "[PlayerValueItem.HasNextLevel]"
							datacontext = "[InGameTopbar.GetDynastyPrestigeItem]"
							raw_text = "[PlayerValueItem.GetProgressTooltip]."
						}

						# expand = { }
					}
				}
			}

			vbox = {
				layoutpolicy_horizontal = expanding
				name = "military"
				datacontext = "[GetPlayer]"
				datacontext = "[GetPlayerArmyComposition]"

				button_group = {
					layoutpolicy_horizontal = expanding
					onclick = "[ToggleGameViewData('military', GetPlayer.GetID)]"
					onclick = "[Clear('resources')]"
					tooltip = "[ArmyComposition.GetArmyCompositionTooltip]"
					using = tooltip_ne

					flowcontainer = {
						spacing = 3
						ignoreinvisible = yes

						text_single = {
							raw_text = "Soldiers:"
						}

						flowcontainer = {
							spacing = 3

							flowcontainer = {

								text_single = {
									name = "strength"
									raw_text = "[ArmyComposition.GetSoldierCountString]"
								}

								text_single = {
									raw_text = " out of [ArmyComposition.GetMaxNumberOfSoldiers]."
								}

								text_single = {
									margin_left = 5
									raw_text = "[ArmyComposition.GetArmyQualityName]."
								}
							}
						}
					}
				}

				button_text = {
					layoutpolicy_horizontal = expanding
					onclick = "[ToggleGameViewData('military', GetPlayer.GetID)]"
					onclick = "[Set('military_view_tabs', 'MV_ARMIES_SELECTION_IMPERIAL')]"
					onclick = "[Clear('resources')]"

					visible = "[GetPlayer.GetGovernment.HasRule( 'administrative' )]"
					blockoverride "text" {
						raw_text = "Imperial armies: [GetPlayer.GetTopLiege.MakeScope.ScriptValue('realm_title_maa')]. You own [Val('personal_title_maa')] and command [Val('only_controlled_title_maa')]."
					}
				}
				button = {
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					visible = "[Not(GreaterThan_int32( Character.GetDomainSize, Character.GetDomainLimit ))]"

					minimumsize = { 60 0 }

					margin_left = 3

					tooltip = "[Character.GetDomainLimitTooltip]"
					using = tooltip_ne

					onclick = "[ToggleGameView('my_realm')]"
					onclick = "[Clear('resources')]"

					flowcontainer = {
						resizeparent = yes
						spacing = 5
						text_single = {
							raw_text = "Domain:"
						}

						text_single = {
							name = "value"
							raw_text = "[Character.GetDomainSize] out of [Character.GetDomainLimit]."
						}
					}
				}

			}

			vbox = {
				layoutpolicy_horizontal = expanding
				datacontext = "[GetPlayer]"

				text_single = {
					layoutpolicy_horizontal = expanding
					visible = "[EqualTo_CFixedPoint(Character.GetDread, '(CFixedPoint)0')]"
					raw_text = "No dread."
				}

				flowcontainer = {
					layoutpolicy_horizontal = expanding
					ignoreinvisible = yes
					visible = "[GreaterThan_CFixedPoint(Character.GetDread, '(CFixedPoint)0')]"
					spacing = 3

					text_single = {
						raw_text = "Dread [Character.GetDread|0],"
						tooltip = "[Character.GetDreadBreakdown]"
					}

					text_single = {
						raw_text = "intimidating [Sval('intimidated_or_terrified_vassals', Character)] vassals with [Sval('intimidated_or_terrified_vassals_strength', Character)] troops total."
					}
				}
			}

			hbox = {
		    layoutpolicy_horizontal = expanding
				spacing = 3

				datacontext = "[GetPlayer]"

				text_single = {
					raw_text = "Stress level: [Character.GetStressLevel],"
					visible = "[GreaterThan_int32(Character.GetStress, '(int32)0')]"
					tooltip = "[Character.GetHealthInfo]"
				}

				text_single = {
					visible = "[GreaterThan_int32(Character.GetStress, '(int32)0')]"
					raw_text = "[GetPlayer.GetStressProgress]% to next level."
				}

				text_single = {
					raw_text = "Stress: [Character.GetStress]."
					tooltip = "[Character.GetHealthInfo]"
				}

			    expand = { }
			}

			expand = { }
		}
	}

	# used for testing ocr
	flowcontainer = {
		parentanchor = center
		visible = no
		direction = vertical
		background = { using = Background_Area_Border_Solid margin = { 5 5 } }

		text_single = {
			raw_text = "Lorem Ipsum dolor est."
		}

		text_single = {
			raw_text = "Multiple members."
		}

		text_single = {
			raw_text = "Great Berber."
		}

		text_single = {
			raw_text = "Stress: 0."
		}

		text_single = {
			raw_text = "0 50 15 5"
		}

		text_single = {
			raw_text = "bold Members"
		}

		text_single = {
			raw_text = "Seljuk"
		}
	}
}

### Time Controls
icon = {
	name = "timeline_widget"
	visible = "[And( And( Not( IsPauseMenuShown ), TimelineWidget.ShouldBeVisible ), Not(GetVariableSystem.Exists('royal_court_screenshot_window')))]"
	size = { 700 25 }
	parentanchor = bottom|right
	filter_mouse = all
	alwaystransparent = yes
	layer = bottom
	allow_outside = yes
	background = {
		using = ocr
		using = Background_Area_Border_Solid margin_left = -50
	}

	# button_decision_entry_text = {
	# 	background = { using = Background_Area_Border_Solid }
	# 	parentanchor = vcenter
	# 	datacontext = "[GetDecisionWithKey('commission_artifact_decision')]"
	# 	onclick = "[OpenGameViewData( 'decision_detail', Decision.Self)]"
	# 	shortcut = confirm
	# }
	button = {
		name = "play_pause_button_tutorial_uses_this"
		onclick = "[OnPause]"
		onclick = "[GetVariableSystem.Clear('hide_event')]"
		shortcut = pause
	}

	# OCR
	flowcontainer = {
		using = ocr
		position = { 35 0 }
		margin_bottom = 5
		ignoreinvisible = yes
		spacing = 3

		button = {
			datacontext = "[GetPlayer]"
			shortcut = zoom_out
			visible = "[Not(IsDiarchyVisible)]"
			clicksound = ""
		}

		button = {
			onclick = "[OpenGameViewData('holding_view', GetPlayer.GetCapitalLocation.Self)]"
			onclick = "[DefaultOnCoatOfArmsRightClick(GetPlayer.GetCapitalLocation.GetTitle.GetID)]"
			shortcut = "mapmode_culture_secondary"
		}

		# Just the hotkeys for increase/decrease speed
		container = {
			name = "speed_hotkeys"


			button = {
				# visible = "[Not(Or(Or(IsLeftWindowOpen, IsRightWindowOpen), IsBottomLeftWindowOpen))]"
				name = "increase_speed"
				size = { 0 0 }

				shortcut = "increase_speed"
				shortcut = "increase_speed_2"
				shortcut = "increase_speed_3"
				onclick = "[OnIncreaseGameSpeed]"
				oversound = "event:/SFX/UI/Generic/sfx_ui_generic_pointer_over"
				clicksound = "event:/SFX/UI/Generic/sfx_ui_generic_increment"
			}

			button = {
				# visible = "[Not(Or(Or(IsLeftWindowOpen, IsRightWindowOpen), IsBottomLeftWindowOpen))]"
				name = "decrease_speed"
				size = { 0 0 }

				shortcut = "decrease_speed"
				shortcut = "decrease_speed_2"
				shortcut = "decrease_speed_3"
				onclick = "[OnDecreaseGameSpeed]"
				oversound = "event:/SFX/UI/Generic/sfx_ui_generic_pointer_over"
				clicksound = "event:/SFX/UI/Generic/sfx_ui_generic_decrement"
			}

			container = {
				visible = "[Not(Or(Or(IsLeftWindowOpen, IsRightWindowOpen), IsBottomLeftWindowOpen))]"
				button = {
					shortcut = speed_1
					onclick = "[SetGameSpeed('(int32)0')]"
				}

				button = {
					shortcut = speed_2
					onclick = "[SetGameSpeed('(int32)1')]"
				}

				button = {
					shortcut = speed_3
					onclick = "[SetGameSpeed('(int32)2')]"
				}

				button = {
					shortcut = speed_4
					onclick = "[SetGameSpeed('(int32)3')]"
				}

				button = {
					shortcut = speed_5
					onclick = "[SetGameSpeed('(int32)4')]"
				}
			}
		}

		widget_gamespeed_sounds = { }

		button_text = {
		    blockoverride "text" {
				raw_text = "[Localize('CURRENT_DATE')]."
				margin_left = 5
		    }
			tooltip = "CURRENT_DATE_TOOLTIP"
			onclick = "[OnPause]"
		}

		text_single = {
			margin_top = 1
			raw_text = "Speed [GetCurrentGameSpeed],"
		}


		flowcontainer = {
			ignoreinvisible = yes
			spacing = 3
			visible = "[IsGamePaused]"

			text_single = {
				margin_top = 1
				raw_text = "Paused"
				visible = "[IsGamePaused]"
			}

			text_single = {
				margin_top = 1
				raw_text = "by event"
				visible = "[IsPausedByEvent]"
			}

			text_single = {
				margin_top = 1
				raw_text = "by you"
				visible = "[IsPausedByMe]"
			}

			dot_l = {}
		}

	}

	date_vanilla = {
		visible = "[GetVariableSystem.Exists('ocr')]"
	}

	hotkeys_HUD_ocr = {}
}

### Bottom Left
widget = {
	name = "bottom_bar"
	visible = "[And( Not( IsPauseMenuShown ), IsDefaultGUIMode )]"
	size = { 100% 100% }
	layer = bottom
	datacontext = "[GetPlayer]"

	# state = {
	# 	name = dismiss_feed
	# }

	using = Animation_ShowHide_Quick

	# vanilla bottom left
	old_hud = {}

	# ocr
	empty_screen = {
		using = ocr

		# there's a bunch of old checks for not('ocr') here, can be removed later

		# activty
		flowcontainer = {
			datacontext = "[GetPlayer]"
			datacontext = "[Character.GetInvolvedActivity]"

			visible = "[And(And( Not( IsPauseMenuShown ), And(And(IsDefaultGUIMode, Character.IsValid), Not(GetVariableSystem.Exists( 'hide_bottom_left_HUD')))), Isnt('ocr'))]"
			visible_at_creation = no
			direction = vertical
			position = { 10 50 }
			ignoreinvisible = yes
			alwaystransparent = no
			margin_left = 5
			background = { using = Background_Area_Border_Solid }

			error_button = { }

			flowcontainer = {
				direction = vertical
				ignoreinvisible = yes
				alpha = 0
				# widget = {
				#     size = { 0 50 }
				# }
				text_single = {
						raw_text = "[Get('toast_1')]"
				}
				text_multi = {
						using = wide
						autoresize = yes
						raw_text = "[Get('toast_desc_1')]"
				}
				# not sure where this comes from
				# widget = {
				#     size = { 0 10 }
				# }
				widget = {
						size = { 0 25 }
						visible = "[Is('toast_extras')]"
				}
				text_single = {
						raw_text = "Dismiss"
				}

				# widget = {
				#     size = { 0 25 }
				# }
				# visible = "[Is('toasted')]"
				visible = no
			}

			# widget = {
			# 	size = { 0 120 }
			# 	visible = "[Is('toasted')]"
			# }

			# activity
			flowcontainer = {
				# margin_top = 50
				direction = vertical
				name = "involved_activity"

				visible = "[Activity.IsValid]"
				visible_at_creation = no
				ignoreinvisible = yes
				datacontext = "[Character.GetTravelPlan]"

				state = {
					name = open_activity
					onclick = "[Activity.OpenActivityView]"
					# on_finish = "[OpenGameViewData('activity_window', Activity.Self)]"
				}

				button_text = {
					shortcut = map_mode_6
					layoutpolicy_horizontal = expanding
					onclick = "[Activity.OpenActivityView]"
					# onclick = "[ToggleGameViewData('activity_window', Activity.Self)]"
					blockoverride "text" {
						raw_text = "Activity: [Activity.GetType.GetName], [AddTextIf( Is('act_event'), 'Event pending, ')]Control A."
					}
				}
			}

			# travel
			flowcontainer = {
				ignoreinvisible = yes
				direction = vertical
				datacontext = "[Character.GetTravelPlan]"
				datacontext = "[Character.GetTravelPlan.GetData]"
				visible = "[And(Character.IsTraveling, TravelPlanData.HasNextDestination)]"

				flowcontainer = {
					ignoreinvisible = yes
					direction = vertical

					button_text = {
						# visible = "[Character.HasActivityState( 'travel' )]"
						onclick = "[ToggleGameViewData('travel_planner', TravelPlan.GetID)]"
						onclick = "[Character.ZoomCameraTo]"
						blockoverride "extra" {
							text_single = {
								raw_text = "Travelling to [TravelPlanData.GetFinalDestination.GetProvince.GetNameNoTooltip],"
							}
							text_single = {
								raw_text = "[TravelPlanData.GetFinalDestination.GetEstimatedArrivalDate.GetTimeDiffFromNow] left, [TravelPlanData.GetFinalDestinationProgress|%0]."
							}
						}
					}

					button = {
						shortcut = map_mode_9
						datacontext = "[GetPlayer.GetCurrentLocation]"
						using = prov_pan
						visible = "[Character.IsTraveling]"
					}

					button_text = {
						using = prov_pan
						datacontext = "[TravelPlanData.GetCurrentLocation]"
						visible = "[Not(ObjectsEqual(MyCapital, Province.Self))]"
						blockoverride "text" {
							raw_text = "Currently in [TravelPlanData.GetCurrentLocation.GetName], [DistanceTo(MyCapital, Province)|0] [DaysTo(MyCapital, Province)] [Direction(MyCapital, Province)]. Shift Q to pan the camera."
						}
						button = {
							shortcut = map_mode_9
							datacontext = "[GetPlayer.GetCurrentLocation]"
							using = prov_pan
						}
					}

					button_text = {
						using = prov_click
						datacontext = "[TravelPlanData.GetNextDestination.GetProvince]"
						visible = "[Not(ObjectsEqual(TravelPlanData.GetNextDestination, TravelPlanData.GetFinalDestination))]"
							blockoverride "text" {
							raw_text = "moving to [TravelPlanData.GetNextDestination.GetProvince.GetName], [TravelPlanData.GetNextDestination.GetEstimatedArrivalDate.GetTimeDiffFromNow] left."
							}
					}

					# button_text = {
					# 	visible = "[Not(ShowRoot('is_land', Province))]"
					# 	using = prov_pan
					# 	shortcut = map_mode_9
					# 	datacontext = "[TravelPlanData.GetCurrentLocation]"
					# 	layoutpolicy_horizontal = expanding
					# 		blockoverride "text" {
					# 				raw_text = "Pan camera to your character, Shift Q."
					# 		}
					# }
					#
					# button_text = {
					# 	visible = "[ShowRoot('is_land', Province)]"
					# 	onclick = "[DefaultOnCoatOfArmsRightClick(Province.GetCoATitle.GetID)]"
					# 	shortcut = map_mode_9
					# 	datacontext = "[TravelPlanData.GetCurrentLocation]"
					# 	layoutpolicy_horizontal = expanding
					# 		blockoverride "text" {
					# 				raw_text = "Pan camera to your character, Shift Q."
					# 		}
					# }
				}

				button_text = {
					name = "activity_travel_button"
					datacontext = "[Character.GetTravelPlan]"
					# visible = "[Character.IsTraveling]"
					visible = no
					blockoverride "dot" {
					}

					blockoverride "text" {
						text = "ACTIVITY_VIEW_TRAVEL"
					}
					tooltip = "[SelectLocalization(Character.GetTravelPlan.GetData.IsTravelWithDomicile, 'TT_TRAVELING_WITH_DOMICILE_WIDGET', 'TT_AWAY_FROM_CAPITAL_WIDGET')]"

					onclick = "[ToggleGameViewData('travel_planner', TravelPlan.GetID)]"
					onclick = "[Character.ZoomCameraTo]"
				}
			}

			flowcontainer = {
				ignoreinvisible = yes
				direction = vertical
				visible = "[And(GetPlayer.HasDomicile, Not(IsGameViewOpen('army')))]"

				button_text = {
					# using = NoWindowsOpen
					datacontext = "[GetPlayer.GetDomicile]"
					shortcut = map_mode_5
					onclick = "[ToggleGameViewData( 'domicile', Domicile.Self )]"
					blockoverride "text" {
						raw_text = "Your [Domicile.GetType.GetNameNoTooltip] is in [Domicile.GetLocation.GetTerrain.GetNameNoTooltip] of [Domicile.GetLocation.GetNameNoTooltip],"
					}
					blockoverride "extra" {
						flowcontainer = {
							ignoreinvisible = yes
							spacing = 3
							visible = "[IsLandlessAdventurer( GetPlayer )]"
							datacontext = "[GetPlayer.GetDomicile]"
							tooltip = "[Domicile.GetProvisionsBreakdown]"

							text_single = {
								raw_text = "Provisions:"
							}

							text_single = {
								raw_text = "[Domicile.GetProvisions|0] out of"
							}

							text_single = {
								raw_text = "[Domicile.GetProvisionsMax],"
							}
						}

						text_single = {
							raw_text = "Control Q."
						}
					}
					# blockoverride "extra" {
					# 	text_single = {
					# 		visible = "[Not(ObjectsEqual( Domicile.GetLocation, GetPlayer.GetCurrentLocation))]"
					# 		datacontext = "[Domicile.GetLocation]"
					# 		raw_text = "[DistanceTo(MyCapital, Province)|0] [DaysTo(MyCapital, Province)] [Direction(MyCapital, Province)]."
					# 	}
					# }
				}
			}

			button_text = {
				layoutpolicy_horizontal = expanding
				visible = "[IsNomad(GetPlayer)]"

				shortcut = court_scene_editor_toolset_translate #w
				datacontext = "[Character.GetInvolvedMigrationSituation]"
				datacontext = "[Situation.GetCharacterCurrentPhase( GetPlayer.Self )]"
				datacontext = "[Situation.GetCharacterCurrentPhase( GetPlayer.Self ).GetType]"
				datacontext = "[Situation.GetParticipantGroupByCharacter(GetPlayer.Self).GetSubRegion]"
				enabled = "[Character.HasInvolvedMigrationSituation]"

				onclick = "[ToggleGameViewData(Situation.GetWindowName, Situation.GetID)]"
				blockoverride "pre" {

					text_single = {
						raw_text = "[SituationPhaseType.GetNameNoTooltip]"
					}
					text_single = {
						raw_text = "for [SituationPhase.GetEndDate.GetTimeToDate],"
					}
					# text_single = {
					# 	raw_text = " in [SituationSubRegion.GetName]."
					# }

				}
				blockoverride "text" {
					raw_text = "Open [Situation.GetNameNoTooltip], W."
				}
				blockoverride "extra" {
				}
				blockoverride "disabled" {
					visible = "[Not(Character.HasInvolvedMigrationSituation)]"
				}
			}

			button_text = {
				layoutpolicy_horizontal = expanding
				visible = "[And(GetPlayer.GetTopLiege.GetGovernment.HasRule( 'administrative' ), Isnt('opened_admin'))]"
				onclick = "[ToggleGameView( 'government_administration' )]"
				down = "[IsGameViewOpen( 'government_administration' )]"
				blockoverride "text" {
					raw_text = "ADMINISTRATIVE_GOVERNMENT_HEADER"
				}
				blockoverride "extra" {
					, = {}
					text_single = {
						raw_text = "J."
					}
				}
			}
		}

		widget = { # Inspiration Details
			visible = "[And( InGameBottomBar.HasSelectedInspiration, And( IsDefaultGUIMode, Not( IsRightWindowOpen ) ) )]"
			visible_at_creation = no
			datacontext = "[InGameBottomBar.GetSelectedInspiration]"
			datacontext = "[Inspiration.GetOwner]"
			position = { 5 150 }
			using = Window_Background_Subwindow

			alwaystransparent = no
			filter_mouse = all

			state = {
				name = _show
				using = Animation_FadeIn_Quick
				using = Sound_WindowShow_Standard
			}

			state = {
				name = _hide
				using = Animation_FadeOut_Quick
				using = Sound_WindowHide_Standard
			}

			widget_inspiration_details_ocr = {
				margin_left = 5
				button = {
					using = close_window_ocr
					onclick = "[InGameBottomBar.ClearSelectedInspiration]"
				}
				blockoverride "hud" {
				}
			}
		}

		### WARS SCHEMES AND MAPMODES AND INSPIRATIONS
		flowcontainer = {
			# visible = "[IsDefaultGUIMode]"
			parentanchor = right|bottom
			widgetanchor = left|bottom
			position = { -650 -25 }
			alwaystransparent = yes
			ignoreinvisible = yes
			filter_mouse = all
			allow_outside = yes
			# spacing = 30
			direction = vertical

			state = {
				name = _show
				using = Animation_FadeIn_Quick
			}

			state = {
				name = _hide
				using = Animation_FadeOut_Quick
			}

			text_single = {
				visible = "[HasOpenSuccession( GetPlayer )]"
				raw_text = "HAS_OPEN_SUCCESSION_SUB_TEXT"
			}

			button_text = {
				background = { using = Background_Area_Border_Solid }
				visible = "[And(GetVariableSystem.Exists('hide_tutorial'), GetTutorial.ShouldBeVisible)]"
				onclick = "[GetVariableSystem.Clear('hide_tutorial')]"
				shortcut = go_to_capital
				blockoverride "text" {
					raw_text = "Open tutorial, hotkey Home."
				}
			}

			flowcontainer = {
				ignoreinvisible = yes
				visible = "[And(IsDefaultGUIMode, Not(IsRightWindowOpen))]"
				direction = vertical

				#TODO can you have multiple contracts?
				### Task Contacts ###
				flowcontainer = {
					background = { using = Background_Area_Border_Solid }
					name = "task_contracts"
					datamodel = "[GetPlayer.GetAcceptedTaskContracts]"
					ignoreinvisible = yes
					direction = vertical

					item = {
						button_task_contract_banner_ocr = {}
					}
				}

				## Wars
				flowcontainer = {
					visible = "[Not(GetVariableSystem.Exists('ocr'))]"
					ignoreinvisible = yes
					direction = vertical
					allow_outside = yes
					background = { using = Background_Area_Border_Solid }

					button_epidemics_ocr = {
						# Epidemics in/near your realm
						name = "epidemics_hud"
						visible = "[Or( InGameBottomBar.HasGlobalNotificationEpidemic, Or( DataModelHasItems( InGameBottomBar.GetEpidemicsInRealm ), DataModelHasItems( InGameBottomBar.GetEpidemicsBorderingRealm ) ) )]"
					}

					button = {
						shortcut = go_to_capital
						clicksound = ""
						visible = "[Not(GetVariableSystem.Exists('hide_tutorial'))]"
					}
					button_text = {
						visible = "[GetVariableSystem.Exists('event_active')]"
						onclick = "[GetVariableSystem.Toggle('hide_event')]"
						shortcut = map_mode_1
						blockoverride "text" {
							raw_text = "[Select_CString(Is('hide_event'), 'Show', 'Hide')] event window, hotkey E."
						}
					}

					button_text = {
						datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
							blockoverride "text" {
									raw_text = "You have [LocalPlayerNewArtifacts.GetNumNewArtifacts] new artifacts. Hotkey i."
							}
						shortcut = mapmode_kingdoms_secondary
						onclick = "[ToggleGameViewData( 'inventory', GetPlayer.GetID )]"
						visible = "[Or( GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'inventory' ), '(int32)0' ), And( Not( GetPlayer.HasRoyalCourt ), GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' ), '(int32)0' ) ) )]"
					}

					flowcontainer = {
						name = "player_inspirations"
						datamodel = "[GetPlayer.GetSponsoredInspirations]"
						allow_outside = yes
						visible = "[Not(IsLeftWindowOpen)]"

						item = {
							button_text = {
								blockoverride "text" {
									alwaystransparent = yes
									raw_text = "[Inspiration.GetName], [Multiply_int32(Inspiration.GetProgress, '(int32)10')]%. [Inspiration.GetEstimatedTimeRemaining]."
								}
								datacontext = "[Inspiration.GetOwner]"
								tooltip = "TT_INSPIRATION_WIDGET"
								onclick = "[InGameBottomBar.ToggleSelectedInspiration( Inspiration.Self )]"
							}
						}
					}

					#TODO
					button_text = {
						datacontext = "[GetPlayer]"
						blockoverride "text" {
								raw_text = "View [Character.GetDiarchyTypeName], Page Up."
						}
						shortcut = zoom_out
						onclick = "[ToggleGameViewData( 'diarchy', Character.GetID )]"
						visible = "[IsDiarchyVisible]"
						# tooltip = "DIARCHY_WINDOW_OPEN_TOOLTIP"
					}

					flowcontainer = {
						spacing = 2
						direction = vertical
						ignoreinvisible = yes
						visible = "[Not(GetPlayer.HasActiveCompanionAISetting('raise_armies'))]"

						button_text = {
							background = { using = Background_Area_Solid margin = { 5 3 } }
							datacontext = "[GetPlayer]"
							blockoverride "text" {
								text = "RAISE_ALL"
							}
							blockoverride "disabled" {
								visible = "[Not(PlayerCanRaiseAnyRallyPoint)]"
							}
							blockoverride "dot" { }
							visible = "[And( Character.IsAtWar, Not(Character.HasRaisedRegiments))]"
							visible_at_creation = no

							enabled = "[PlayerCanRaiseAnyRallyPoint]"
							onclick = "[PlayerRaiseAllRegiments]"
							# onclick = "[OpenGameView('outliner')]"
							clicksound = "event:/SFX/UI/Unit/Army/sfx_ui_raise_army"

							onclick = "[PdxGuiTriggerAllAnimations('button_army')]"

							tooltip = "[GetPlayerRaiseAllTooltip]"
							shortcut = confirm
						}

						button_text = {
							background = { using = Background_Area_Solid margin = { 5 3 } }
							datacontext = "[GetPlayer]"
							blockoverride "text" {
								raw_text = "Click here with Control slash to not split armies"
							}
							blockoverride "dot" { }
							visible = "[And( Character.IsAtWar, Not(Character.HasRaisedRegiments))]"
							visible_at_creation = no
							# onclick = "[OpenGameView('outliner')]"

							enabled = "[PlayerCanRaiseAnyRallyPoint]"
							onclick = "[PlayerRaiseAllRegiments]"
							clicksound = "event:/SFX/UI/Unit/Army/sfx_ui_raise_army"

							onclick = "[PdxGuiTriggerAllAnimations('button_army')]"

							tooltip = "[GetPlayerRaiseAllTooltip]"
						}

						button_text = {
							background = { using = Background_Area_Solid margin = { 5 3 } }
							visible = "[And(PlayerShouldDisbandAll, PlayerCanDisbandAll)]"
							visible_at_creation = no

							onclick = "[PlayerDisbandAll]"
							enabled = "[PlayerCanDisbandAll]"
							clicksound = "event:/SFX/UI/Unit/Army/sfx_ui_unit_army_disband"
							datacontext = "[GetPlayer]"
							onclick = "[CloseGameView('outliner')]"

							blockoverride "text" {
								text = "DISBAND_ALL"
							}
							blockoverride "extra" {
								text_single = {
									margin_left = -3
									raw_text = ", Control L."
								}
							}
							shortcut = map_mode_17

							tooltip = "[GetDisbandAllTooltip]"
						}
					}

					flowcontainer = {
						ignoreinvisible = yes
						spacing = 3
						visible = "[GetPlayer.HasActiveCompanionAISetting('raise_armies')]"

						text_single = {
							raw_text = "Armies are"
						}

						text_single = {
							visible = "[GetPlayer.HasRaisedRegiments]"
							raw_text = "raised and"
						}

						text_single = {
							raw_text = "automated"
						}

						text_single = {
							visible = "[And(Not(GetPlayer.HasRaisedRegiments), GetPlayer.IsAtWar)]"
							raw_text = "and should be raised soon"
						}

						text_single = {
							visible = "[And(Not(GetPlayer.HasRaisedRegiments), Not(GetPlayer.IsAtWar))]"
							raw_text = "and will be raised once you're at war"
						}

						text_single = {
							visible = "[And(GetPlayer.HasRaisedRegiments, Not(GetPlayer.IsAtWar))]"
							raw_text = "and should be dismissed soon."
						}

						dot_l = {}
					}

					container = {
						visible = "[And(GetPlayer.HasRaisedRegiments, GetPlayer.HasActiveCompanionAISetting('raise_armies'))]"

						state = {
							name = _show

							start_sound = {
								soundeffect = "event:/SFX/UI/Unit/Army/sfx_ui_raise_army"
							}
						}
					}

					flowcontainer = {
						name = "wars"
						ignoreinvisible = yes
						allow_outside = yes
						direction = vertical

						flowcontainer = {
							name = "great_holy_wars"
							ignoreinvisible = yes

							flowcontainer = {
								datamodel = "[GetPlayer.GetFaith.GetDefensiveGreatHolyWars]"
								ignoreinvisible = yes

								item = {
									button_text = {
											blockoverride "text" {
													raw_text = "Holy War."
											}
										blockoverride "extra" {
											text_single = {
												raw_text = " [GreatHolyWar.GetTimeUntilLaunch]."
												visible = "[Not(GreatHolyWar.HasWarStarted)]"
												align = left
											}
										}
										onclick = "[OpenGameViewData( 'great_holy_war', GreatHolyWar.GetID )]"

									}
								}
							}

							button_text = {
								blockoverride "text" {
									raw_text = "Holy War."
								}
								blockoverride "extra" {
									text_single = {
										raw_text = " [GreatHolyWar.GetTimeUntilLaunch]."
										visible = "[Not(GreatHolyWar.HasWarStarted)]"
										align = left
									}
									# text_single = {
									# 	raw_text = " Your rank"
									# 	visible = "[GreatHolyWar.HasWarStarted]"
									# }
								}
								onclick = "[OpenGameViewData( 'great_holy_war', GreatHolyWar.GetID )]"

								name = "player_faith_ghw"
								datacontext = "[GetPlayer.GetFaith.GetGreatHolyWar]"
								visible = "[GetPlayer.GetFaith.HasOffensiveGreatHolyWar]"
							}
						}

						flowcontainer = {
							name = "raids_on_me"
							datamodel = "[GetPlayer.GetHostileRaiders]"
							allow_outside = yes
							direction = vertical

							item = {
								button_text = {
									onclick = "[DefaultOnCharacterClick(Character.GetID)]"
										blockoverride "text" {
										max_width = 580
												raw_text = " Raided by [Character.GetPrimaryTitle.GetNameNoTierNoTooltip], [GetPlayer.GetRaidHostilityEnd( Character.Self ).GetTimeDiffFromNow] until hostilities end."
										}
								}
							}
						}

						flowcontainer = {
							name = "raids_by_me"
							datamodel = "[GetPlayer.GetRaidTargets]"
							direction = vertical

							item = {
								button_text = {
									onclick = "[DefaultOnCharacterClick(Character.GetID)]"
										blockoverride "text" {
										max_width = 580
												raw_text = " Raiding [Character.GetPrimaryTitle.GetNameNoTierNoTooltip], [GetPlayer.GetRaidHostilityEnd( Character.Self ).GetTimeDiffFromNow] until hostilities end."
										}
								}
							}
						}

						flowcontainer = {
							name = "regular_wars"
							datamodel = "[InGameBottomBar.GetWarItems]"
							ignoreinvisible = yes
							direction = vertical

							item = {
								button_text = {
									widget = {
										visible = "[WarItem.CanEnforceVictory]"

										state = {
											name = _show

											start_sound = {
												soundeffect = "event:/SFX/UI/War/sfx_ui_war_enforce_demand"
												soundparam = {
													name = StateChange
													value = 1.5
												}
											}
										}
									}
									blockoverride "pre" {
										text_single = {
											raw_text = "Hidden"
											margin_right = 4
											visible = "[GetScriptedGui('hide_units_in_war').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).AddScope('target', WarItem.GetWar.MakeScope).End )]"
										}
										text_single = {
											margin_right = 4
											raw_text = "Liege"
											visible = "[Not(WarItem.IsPlayerParticipant)]"
										}
										text_single = {
											margin_right = 4
											visible = "[GetScriptedGui('is_civil_war').IsShown( GuiScope.SetRoot( WarItem.GetWar.MakeScope ).End )]"
											raw_text = "Civil"
										}
									}
										blockoverride "text" {
												raw_text = "War against [WarItem.GetWar.GetPrimaryPlayerEnemy.GetPrimaryTitle.GetNameNoTierNoTooltip]"
										max_width = 560
										}
									blockoverride "extra" {
										text_single = {
											visible = "[Not(EqualTo_CFixedPoint(WarItem.GetWarScoreFraction, '(CFixedPoint)0'))]"
											raw_text = ", [WarItem.GetWarScoreFraction|0%+]."
										}
										text_single = {
											visible = "[EqualTo_CFixedPoint(WarItem.GetWarScoreFraction, '(CFixedPoint)0')]"
											raw_text = ", zero percent."
										}
										text_single = {
											visible = "[WarItem.CanEnforceVictory]"
											raw_text = " You can enforce demands!"
										}
										text_single = {
											visible = "[IsIndexFirst]"
											raw_text = "Shift W."
										}
									}
									onclick = "[WarItem.OnClick]"
									onrightclick = "[GetScriptedGui('hide_units_in_war').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).AddScope('target', WarItem.GetWar.MakeScope).End )]"

									button = {
										visible = "[IsIndexFirst]"
										onclick = "[WarItem.OnClick]"
										shortcut = map_mode_10

									}
								}
							}
						}

						text_single = {
							margin_left = 5
							visible = "[GreaterThan_int32(GetDataModelSize(InGameBottomBar.GetWarItems), '(int32)1')]"
							raw_text = "You can right click a war to hide it from lists."
						}

						button_text = {
							# visible = "[Not(IsGameViewOpen('outliner'))]"
							# visible = "[And(And(Not(Or(Or(IsGameViewOpen('dynasty_view'), IsGameViewOpen('holding_view')), IsGameViewOpen('lifestyle'))), Not(IsGameViewOpen('character'))), Not(IsGameViewOpen('ruler_designer')))]"
							visible = "[And(Character.HasRaisedRegiments, Not(IsGameViewOpen('holding_view')))]"
							blockoverride "text" {
								raw_text = "Press U to select your first unit."
							}

							shortcut = "mapmode_duchies_secondary"
							onclick = "[ToggleGameView('outliner')]"
							onclick = "[PdxGuiTriggerAllAnimations('select_first_army_delay')]"
							# onclick = "[CloseGameView('my_realm')]"
						}

						state = {
							name = select_first_army_delay
							delay = 0.1
							on_finish = "[PdxGuiTriggerAllAnimations('select_first_army')]"
						}
					}

					flowcontainer = {
						datamodel = "[InGameBottomBar.GetSchemes]"
						direction = vertical

						item = {
							button_text = {
								blockoverride "extra" {
									text_single = {
										visible = "[Scheme.IsExposed]"
										raw_text = "game_concept_exposed"
									}


									text_single = {
										raw_text = "SCHEME_WIDGET_SUCCESS_CHANCE"
									}

									text_single = {
										raw_text = "Chance,"
									}

									text_single = {
										raw_text = "[BottomBarSchemeItem.GetScheme.GetSchemeType.GetTypeNameNoTooltip]"
									}

									# Target
									container = {

										# Character Target
										container = {
											datacontext = "[Scheme.GetTargetCharacter]"
											visible = "[Character.IsValid]"

											text_single = {
												raw_text = "[Character.GetFirstNameNoTooltip],"
											}
											text_single = {
												raw_text = ""
											}
										}

										# Title Target
										container = {
											datacontext = "[Scheme.GetTargetTitle]"
											visible = "[Title.IsValid]"
											text_single = {
												raw_text = "[Title.GetNameNoTierNoTooltip]"
											}
										}

										# Faith Target
										container = {
											datacontext = "[Scheme.GetTargetFaith]"
											visible = "[Faith.IsValid]"
											text_single = {
												raw_text = "[Faith.GetNameNoTooltip]"
											}
										}

										# Culture Target
										container = {
											datacontext = "[Scheme.GetTargetCulture]"
											visible = "[Culture.IsValid]"

											text_single = {
												text = "[Culture.GetNameNoTooltip]"
											}
										}
									}

									text_single = {
										visible = "[Scheme.GetSchemeType.IsBasic]"
										raw_text = "[Scheme.GetProgressBar|%0],"
									}


									text_single = {
										datacontext = "[Scheme.GetTargetCharacter]"
										visible = "[And(And(Character.IsValid, Not(BottomBarSchemeItem.GetScheme.GetSchemeType.IsHostile)), Scheme.GetSchemeType.IsPersonal)]"

										raw_text = "[Character.GetOpinionOf(GetPlayer)|=] opinion,"
										tooltip = "[Character.GetOpinionBreakdownText(GetPlayer)]"
									}

									####

									text_single = {
										visible = "[GreaterThan_int32( Scheme.GetAgentCharges, '(int32)0' )]"
										raw_text = "advantages [Scheme.GetAgentCharges],"
									}

									text_single = {
										visible = "[GreaterThan_int32( Scheme.GetAgentCharges, '(int32)4' )]"
										raw_text = "can execute."
									}

									container = {
										visible = "[And(Scheme.GetSchemeCountermeasureProtectingTarget.IsValid, Scheme.GetSchemeType.IsHostile)]"
										ignoreinvisible = yes

										text_single = {
											visible = "[SchemeCountermeasureType.IsValid]"
											datacontext = "[Scheme.GetSchemeCountermeasureProtectingTarget]"
											raw_text = "countered by [SchemeCountermeasureType.GetName]."
										}
									}

								}
								onclick = "[BottomBarSchemeItem.OnClick]"
								datacontext = "[BottomBarSchemeItem.GetScheme]"
								# tooltip = "BOTTOMBAR_SCHEME_TOOLTIP"
							}
						}
					}
					# mod
					flow_wok_courtships_hud = {}

					### Situations ###
					flowcontainer = {
						name = "situations"
						datamodel = "[GetPlayer.GetInvolvedSituations]"
						ignoreinvisible = yes

						item = {
							button_situation_banner_ocr = {}
						}
					}

					flowcontainer = {
						name = "involved_struggles"
						datamodel = "[GetPlayer.GetInvolvedStruggles]"
						ignoreinvisible = yes

						item = {
							button_text = {
								shortcut = map_mode_16
								blockoverride "text" {
										raw_text = "Struggle, Control E"
								}
								onclick = "[ToggleGameViewData('struggle', Struggle.GetID)]"
								clicksound = "event:/DLC/FP2/SFX/UI/fp2_struggle_view_open"
								blockoverride "extra" {
									text_single = {
										raw_text = ", [Struggle.GetCurrentPhase.GetNameNoTooltip]."
										visible = "[Not(Struggle.IsInTransitionPhase)]"
									}
									text_single = {
										raw_text = ", In transition, [Struggle.GetTransitionCompeleteDate.GetTimeDiffFromNow]."
										visible = "[Struggle.IsInTransitionPhase]"

									}
									#TODO!
									text_single = {
										raw_text = " Moving to [Struggle.GetCurrentLeadingPhase.GetNameNoTooltip], [Struggle.GetPhaseValue(Struggle.GetCurrentLeadingPhase)] out of [Struggle.GetPhaseDurationValue]."
									}
								}
								datacontext = "[GetPlayer]"
								# tooltipwidget = struggle_tooltip
							}
						}
					}

					flowcontainer = {
						name = "interloper_struggles"
						datamodel = "[GetPlayer.GetInterloperStruggles]"
						ignoreinvisible = yes

						item = {
							button_text = {
								shortcut = map_mode_16
								blockoverride "text" {
									raw_text = "Struggle, Control E"
								}
								onclick = "[ToggleGameViewData('struggle', Struggle.GetID)]"
								clicksound = "event:/DLC/FP2/SFX/UI/fp2_struggle_view_open"
								blockoverride "extra" {
									text_single = {
										raw_text = ", [Struggle.GetCurrentPhase.GetNameNoTooltip]."
										visible = "[Not(Struggle.IsInTransitionPhase)]"
									}
									text_single = {
										raw_text = ", In transition, [Struggle.GetTransitionCompeleteDate.GetTimeDiffFromNow]."
										visible = "[Struggle.IsInTransitionPhase]"
									}
									# text_single = {
									# 	raw_text = " Moving to [Struggle.GetCurrentLeadingPhase.GetNameNoTooltip], [Struggle.GetPhaseProgressValue(Struggle.GetCurrentLeadingPhase)] out of [GetDefine('NStruggle', 'PHASE_TRANSITION_THRESHOLD')]."
									# 	align = left
									# }
									text_single = {
										raw_text = " Moving to [Struggle.GetCurrentLeadingPhase.GetNameNoTooltip], [Struggle.GetPhaseValue(Struggle.GetCurrentLeadingPhase)] out of [GetDefine('NStruggle', 'PHASE_TRANSITION_THRESHOLD')]."
										align = left
									}
								}
								datacontext = "[GetPlayer]"
								tooltipwidget = struggle_tooltip
							}
						}
					}

					flowcontainer = {
						ignoreinvisible = yes
						direction = vertical
						visible = "[HasViewHistory]"
						# visible = no

						button_text = {
							shortcut = "go_back"
							onclick = "[OpenFromViewHistory]"
							onclick = "[Clear('extra_window')]"
							blockoverride "text" {
								raw_text = "[GetViewHistoryTooltip]"
							}
						}
					}


					flowcontainer = {
						name = "observer_status"
						visible = "[IsObserver]"
						visible_at_creation = no
						ignoreinvisible = yes

						background = { using = Background_Area_Border_Solid margin = { 0 2 } }
						margin_left = 5

						text_single = {
							name = "global_observer_indication"
							visible = "[Not(GetPlayer.IsValid)]"
							text = "GLOBAL_OBSERVER"
						}

						text_single = {
							name = "player_observer_indication"
							visible = "[GetPlayer.IsValid]"
							raw_text = "Observing as [GetPlayer.GetShortUINameNotMeNoTooltip]."
						}

						button_cancel = {
							visible = "[And(GetVariableSystem.Exists('ocr'), GetPlayer.IsValid)]"
							name = "cancel_button"
							# visible = "[GetPlayer.IsValid]"

							size = { 30 30 }
							onclick = "[ClearObserver]"
							tooltip = "OBSERVER_MODE_ON"
						}

						icon_observer = {
							size = { 30 30 }
							visible = "[Not(GetPlayer.IsValid)]"
						}
					}

					# to avoid overlap of the back button with suggestions
					container = {
						visible = "[Not(IsObserver)]"
						widget = {
							visible = "[Not(GetScriptedGui('show_suggestions').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )), Not(IsObserver)]"
							size = { 0 23 }
						}
					}
				}

				container = {
					ignoreinvisible = yes
					visible = "[GetPlayer.IsValid]"
					flowcontainer = {
					ignoreinvisible = yes
					background = { using = Background_Area_Border_Solid }
					visible = "[And(Not(IsLeftWindowOpen), Not(GetVariableSystem.Exists('ocr')))]"
					margin = { 5 0 }
					direction = vertical

					sorcery_button_locr = {}

					flowcontainer = {
						visible = "[Or( And(GetTutorial.ShouldBeVisible, Show('toggle_hud_hotkeys')), And(Not(GetTutorial.ShouldBeVisible), Not(Show('toggle_hud_hotkeys'))) )]"
						# visible = "[Isnt('hide_shortcuts')]"
						# visible = "[Show('toggle_hud_hotkeys')]"
							ignoreinvisible = yes
						direction = vertical

						text_single = {
							layoutpolicy_horizontal = expanding
							margin_left = 3
							raw_text = "All menus:"
						}


						button_text = {
							layoutpolicy_horizontal = expanding
							blockoverride "text" {
								raw_text = "Your character, F one."
							}
							onclick = "[PauseMenu.Resume]"
							onclick = "[ToggleGameViewData( 'character', GetPlayer.GetID )]"
							shortcut = "character_window"
							onclick = "[Clear('extra_window')]"
						}

						button_text = {
							layoutpolicy_horizontal = expanding
							blockoverride "text" {
								raw_text = "[Localize('MY_REALM_BUTTON')], F2."
							}
							onclick = "[PauseMenu.Resume]"
							onclick = "[ToggleGameView('my_realm')]"
							shortcut = "my_realm_window"
							onclick = "[Clear('extra_window')]"
						}

						button_text = {
							layoutpolicy_horizontal = expanding
							blockoverride "text" {
								raw_text = "[Localize('MILITARY_BUTTON')], F3."
							}
							onclick = "[PauseMenu.Resume]"
							onclick = "[ToggleGameViewData('military', GetPlayer.GetID)]"
							shortcut = "military_window"
							onclick = "[Clear('extra_window')]"
						}
						button_text = {
							blockoverride "text" {
								raw_text = "[Localize('COUNCIL_BUTTON')], F4."
							}
							onclick = "[ToggleGameViewData('council_window', GetPlayer.GetID)]"
							shortcut = "council_window"
							onclick = "[Clear('extra_window')]"
							visible = "[Not( IsLandlessAdventurer( GetPlayer ) )]"
						}

						button_text = {
							name = "hud_camp_button"
							widgetid = "hud_camp_button"
							shortcut = "map_mode_5"
							datacontext = "[Character.GetDomicile]"
							visible = "[Character.HasDomicile]"

							onclick = "[ToggleGameViewData( 'domicile', Domicile.Self )]"
							# tooltip = "[Domicile.GetMapPinTooltip( Character.Self )]"
							blockoverride "text" {
								raw_text = "Your [SelectLocalization(IsLandlessAdventurer( GetPlayer ), 'camp', 'estate')], Control Q."
							}
						}

						button_text = {
							blockoverride "text" {
								raw_text = "[Localize('COURT_BUTTON')], F five."
							}
							onclick = "[ToggleGameViewData( 'court_window', GetPlayer.GetID )]"
							shortcut = "court_window"
							onclick = "[Clear('extra_window')]"
						}
						button_text = {
							blockoverride "text" {
								raw_text = "[Localize('INTRIGUE_BUTTON')], F6."
							}
							onclick = "[ToggleGameViewData('intrigue_window', GetPlayer.GetID)]"
							shortcut = "intrigue_window"
							onclick = "[Clear('extra_window')]"
						}
						button_text = {
							blockoverride "text" {
								raw_text = "[Localize('FACTION_BUTTON')], F7."
							}
							onclick = "[ToggleGameView('factions_window')]"
							shortcut = "factions_window"
							onclick = "[Clear('extra_window')]"
							visible = "[Or( Not( IsLandlessAdventurer( GetPlayer ) ), GetPlayer.IsInAFaction)]"
						}
						button_text = {
							blockoverride "text" {
								raw_text = "[Localize('DECISIONS_BUTTON')], F8." #TODO change to contracts? GetPlayer.GetGovernment.IsType( 'landless_adventurer_government' )
							}
							onclick = "[ToggleGameView('decisions')]"
							shortcut = "decision_window"
							onclick = "[Clear('extra_window')]"
						}
						button_text = {
							blockoverride "text" {
								raw_text = "[Localize('ACTIVITY_LIST_BUTTON')], F9."
							}
							onclick = "[ToggleGameView('activity_list_window')]"
							shortcut = "activity_list_window"
							onclick = "[Clear('extra_window')]"
						}

						button_text = {
							blockoverride "text" {
								raw_text = "Encyclopedia, F ten."
							}
							onclick = "[ToggleEncyclopedia]"
							shortcut = "encyclopedia"
						}

						button_text = {
							visible = "[GetPlayer.GetTopLiege.GetGovernment.HasRule( 'administrative' )]"
							onclick = "[ToggleGameView( 'government_administration' )]"
							down = "[IsGameViewOpen( 'government_administration' )]"
							blockoverride "text" {
								raw_text = "ADMINISTRATIVE_GOVERNMENT_HEADER"
							}
							blockoverride "extra" {
								, = {}
								text_single = {
									raw_text = "J."
								}
							}
						}

						container = {
							visible = "[GetPlayer.IsValid]"
							ignoreinvisible = yes
							flowcontainer = {
								ignoreinvisible = yes
								direction = vertical
								# visible = "[GetPlayer.GetGovernment.IsType( 'clan_government' )]"
								datacontext = "[GetPlayer]"
								visible = "[GetScriptedGui('tycv_have_clan_vassals').IsShown( GuiScope.SetRoot( Character.MakeScope ).End )]"

								button_text = {
									shortcut = map_mode_11
									visible = "[Character.HasTaxSlots]"
									blockoverride "extra" {
										text_single = {
											raw_text = "[Localize('TAX_JURISDICTIONS_BUTTON')], Shift E."
										}
									}
									onclick = "[ToggleGameViewData('manage_tax_slots', GetPlayer.GetID)]"
									# shortcut = "activity_list_window"
									onclick = "[Clear('extra_window')]"
								}

								flowcontainer = {
									ignoreinvisible = yes
									direction = vertical

									visible = "[GreaterThan_int32( Character.GetUnassignedVassalsCount, '(int32)0' )]"

									button_text = {
										blockoverride "extra" {
											text_single = {
												raw_text = "TAX_SLOT_OVERVIEW_WINDOW_UNASSIGNED_VASSALS_WARNING"
											}
										}
										onclick = "[ToggleGameViewData('manage_tax_slots', GetPlayer.GetID)]"
										onclick = "[Clear('extra_window')]"
									}
									button_text = {
										visible = "[GreaterThan_int32( Character.GetUntaxedJurisdictionCount, '(int32)0' )]"
										blockoverride "extra" {
											text_single = {
												raw_text = "TAX_SLOT_OVERVIEW_WINDOW_TAX_SLOTS_WARNING"
											}
										}
										onclick = "[ToggleGameViewData('manage_tax_slots', GetPlayer.GetID)]"
										onclick = "[Clear('extra_window')]"
									}
									button_text = {
										visible = "[Not(Character.HasTaxSlots)]"
										blockoverride "extra" {
											text_single = {
												raw_text = "NO_TAX_SLOT_AVAILABLE"
											}
										}
										onclick = "[ToggleGameViewData('manage_tax_slots', GetPlayer.GetID)]"
										onclick = "[Clear('extra_window')]"
									}

									# widget_hud_main_tab = {
									# 	name = "tab_government_administration"
									# 	visible = "[GetPlayer.GetTopLiege.GetGovernment.HasRule( 'administrative' )]"
									#
									# 	blockoverride "maintab_button"
									# 	{
									# 		texture = "gfx/interface/skinned/hud_maintab/maintab_administrative.dds"
									#
									# 		onclick = "[ToggleGameView( 'government_administration' )]"
									# 		down = "[IsGameViewOpen( 'government_administration' )]"
									#
									# 		using = tooltip_ws
									# 		tooltipwidget = {
									# 			administrative_button_tooltip = {}
									# 		}
									# 	}
									# }

									# button_text = {
									# 	name = "toggle_message_settings_button"
									# 	text = "MESSAGE_SETTINGS_WINDOW_NAME"
									# 	onclick = "[ToggleMessageSettings]"
									# 	onclick = "[GetVariableSystem.Toggle( 'extra_buttons_expand' )]"
									# 	tooltip = "MESSAGE_SETTINGS_WINDOW_TT"
									# }

									# button_text = {
									# 	name = "toggle_music_player_button"
									# 	raw_text = "MUSIC_PLAYER_NAME"
									# 	onclick = "[ToggleMusicPlayer]"
									# 	tooltip = "MUSIC_PLAYER_OPEN_PLAYER_TT"
									# }

									#TODO music and message settings

									#TODO admin view

								}
							}
						}


						button_text = {
							datacontext = "[GetPlayer]"
							visible = "[Character.HasRoyalCourt]"
							onclick = "[Character.OpenRoyalCourtView( 'characters' )]"
								blockoverride "text" {
										raw_text = "Royal court, Control R."
								}
						}

						button_text = {
							datacontext = "[GetPlayer]"
							visible = "[Character.HasRoyalCourt]"
							onclick = "[Character.OpenRoyalCourtView( 'characters' )]"
							datacontext = "[AccessLocalPlayerCachedData]"
							datacontext = "[LocalPlayerCachedData.AccessNewArtifacts]"
							datacontext = "[LocalPlayerCachedData.AccessCourtEvents]"
							datacontext = "[Character.GetCourtGrandeurData]"

							blockoverride "extra" {
								text_single = {
									visible = "[GreaterThan_int32( GetPlayer.GetNumPendingCourtEvents, '(int32)0')]"
									raw_text = "[GetPlayer.GetNumPendingCourtEvents] events."
								}

								text_single = {
									visible = "[GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' ), '(int32)0')]"
									raw_text = "[LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' )] new artifacts."
								}

								text_single = {
									tooltip = "ROYAL_COURT_STATUS_CGV_EXPECTATIONS"
									raw_text = "Low grandeur."
									visible = "[LessThan_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel )]"
								}
							}
						}

						button_text = {
							onclick = "[GetVariableSystem.Toggle('resources')]"
							shortcut = map_mode_3
							visible = "[Isnt('mp_lobby_tabs')]"
							blockoverride "text" {
								raw_text = "Resources, R."
							}
						}

						button_text = {
							onclick = "[CloseGameView('holding_view')]"
							onclick = "[CloseGameView('army')]"
							onclick = "[ToggleGameView('outliner')]"
							blockoverride "text" {
								raw_text = "Outliner, O."
							}
						}

						button_text = {
							onclick = "[ToggleGameViewData( 'inventory', GetPlayer.GetID )]"
							shortcut = mapmode_kingdoms_secondary
							visible = "[Isnt('mp_lobby_tabs')]"
							blockoverride "text" {
								raw_text = "Inventory, i. [Val('num_artifacts')] artifacts."
							}
						}

						button_text = {
							name = "plagues_shortcut"
							onclick = "[ToggleGameView( 'epidemics' )]"
							onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
							blockoverride "text" {
								text = "EXPLORE_PLAGUES"
							}
							blockoverride "extra" {
								comma = {}
								text_single = {
									raw_text = "P."
								}
							}
							shortcut = "explore_plagues"
						}

						button_text = {
							visible = "[HasDlcFeature( 'legends' )]"
							name = "legends_shortcut"
							onclick = "[ToggleGameView( 'legends' )]"
							onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
							shortcut = "explore_legends"
							blockoverride "text" {
								text = "EXPLORE_LEGENDS"
							}
							blockoverride "extra" {
								comma = {}
								text_single = {
									raw_text = "L."
								}
							}
						}

						button_text = {
							onclick = "[ToggleGameView( 'character_finder' )]"
							blockoverride "text" {
								raw_text = "Character search, C."
							}
							shortcut = "character_finder"
							onclick = "[Clear('extra_window')]"
						}

						button_text = {
							onclick = "[ToggleGameView( 'find_title' )]"
							shortcut = find_title_shortcut
							onclick = "[Clear('extra_window')]"
							blockoverride "text" {
								raw_text = "Title search, V."
							}
						}
					}

					button_text = {
						blockoverride "text" {
							raw_text = "[Select_CString( Or( And(GetTutorial.ShouldBeVisible, Show('toggle_hud_hotkeys')), And(Not(GetTutorial.ShouldBeVisible), Not(Show('toggle_hud_hotkeys'))) ), 'Hide', 'Show')] menus and shortcuts, Page Down."
						}
						shortcut = zoom_in
						onclick = "[Click('toggle_hud_hotkeys')]"
						# onclick = "[Sgui('toggle_hud_hotkeys', Execute, GetPlayer)]"
						# onclick = "[Toggle('hide_shortcuts')]"
					}

					widget = {
						size = { 0 5 }
					}
				}
				}
			}
		}
	}
}

######################################################
############# MESSAGES AND NOTIFICATIONS #############
######################################################

#TODO make a sighted version

### Toasts
notifications_toasts = {
	layer = top
}

### Message Feed
notifications_message_feed_combined = {
	layer = top
}

### Suggestions / Current Situation
notifications_suggestions = {
	layer = windows_layer

	attachto = {
		widgetid = "suggestions_placer"
	}
}

######################################################
################ TYPES AND TEMPLATES #################
######################################################


template close_character {
	onclick = "[CloseGameView('character')]"
}


types HUD
{
	type Animation_HUD_daily_tick = widget {
		using = Animation_ShowHide_Quick

		icon = {
			size = { 100% 100% }
			texture = "gfx/interface/colors/white.dds"
			shaderfile = "gfx/FX/pdxgui_repeat_texture.shader"
			color = { 0.63 0.59 0.68 1 }

			block "alpha"
			{
				alpha = 0.5
			}

			modify_texture = {
				name = "pattern"
				texture = "gfx/interface/component_masks/mask_clouds.dds"
				spriteType = corneredtiled
				blend_mode = alphamultiply
			}

			modify_texture = {
				texture = "gfx/interface/component_masks/mask_fade_horizontal_middle_thick.dds"
				blend_mode = alphamultiply
			}

			state = {
				name = a
				next = b
				duration = 0
				trigger_on_create = yes

				modify_texture = {
					name = "pattern"
					translate_uv = { 0 0 }
				}
			}

			state = {
				name = b
				next = a
				block "duration"
				{
					duration = 2
				}

				modify_texture = {
					name = "pattern"
					translate_uv = { -1 0 }
				}
			}
		}
	}

	type progressbar_hud_stress_glow = icon {
		size = { 100% 100% }

		block "lvl_3"
		{
			alpha = 0
		}

		shaderfile = "gfx/FX/pdxgui_repeat_texture.shader"

		modify_texture = {
			name = "clouds"
			texture = "gfx/interface/component_masks/mask_clouds.dds"
			blend_mode = alphamultiply
			spriteType = corneredtiled
			texture_density = 3
		}

		state = {
			name = mask_a
			next = mask_b
			trigger_on_create = yes

			modify_texture = {
				name = "clouds"
				translate_uv = { 0 -1 }
			}
		}

		state = {
			name = mask_b
			next = mask_a
			duration = 8

			modify_texture = {
				name = "clouds"
				translate_uv = { 0 1 }
			}
		}

		state = {
			block "animation_trigger_1"
			{
				name = "stress_level_increase"
			}
			next = "fade_out"

			duration = 0.2
			delay = 0.3
			bezier = { 0.5 0 1 0.5 }
			alpha = 1
		}

		block "lvl_3" {
			state = {
				block "animation_trigger_2"
				{
					name = "stress_increase"
				}
				next = "fade_out"

				duration = 0.2
				delay = 0.3
				bezier = { 0.5 0 1 0.5 }
				alpha = 1
			}

			state = {
				name = "fade_out"

				duration = 1.5
				bezier = { 0 0.5 0.5 1 }
				alpha = 0
			}
		}
	}

	type progressbar_hud_stress = icon {
		shaderfile = "gfx/FX/pdxgui_repeat_texture.shader"
		alpha = 0.8

		block "bar_color"
		{
			# texture = "gfx/interface/colors/red.dds"
		}

		modify_texture = {
			texture = "gfx/interface/component_masks/mask_rough_edges.dds"
			spriteType = Corneredtiled
			spriteborder = { 20 20 }
			blend_mode = alphamultiply
			texture_density = 5
		}

		modify_texture = {
			texture = "gfx/interface/component_masks/mask_fade_horizontal.dds"
			blend_mode = alphamultiply
			alpha = 0.3
		}

		modify_texture = {
			texture = "gfx/interface/component_masks/mask_scratches.dds"
			blend_mode = alphamultiply
			spriteType = corneredtiled
			alpha = 0.3
			texture_density = 3
		}

		modify_texture = {
			name = "flash"
			texture = "gfx/interface/colors/white.dds"
			blend_mode = colordodge
			alpha = 0
		}

		modify_texture = {
			visible = "[GreaterThanOrEqualTo_int32(GetPlayer.GetStressLevel, '(int32)2')]"
			name = "lvl3_glow"
			texture = "gfx/interface/colors/gold.dds"
			blend_mode = colordodge
			alpha = 0
		}

		modify_texture = {
			name = "clouds"
			texture = "gfx/interface/component_masks/mask_clouds_solid.dds"
			blend_mode = mask
			spriteType = corneredtiled
			texture_density = 1
		}

		modify_texture = {
			block "bar_color_flow"
			{
				# texture = "gfx/interface/colors/yellow.dds"
				alpha = 0.3
			}
			blend_mode = colordodge
		}

		state = {
			name = "lvl3_glow_a"
			next = "lvl3_glow_b"
			duration = 0.6
			trigger_on_create = yes
			using = Animation_Curve_Default

			modify_texture = {
				name = "lvl3_glow"
				alpha = 0.5
			}
		}

		state = {
			name = "lvl3_glow_b"
			next = "lvl3_glow_a"
			duration = 1.5
			using = Animation_Curve_Default

			modify_texture = {
				name = "lvl3_glow"
				alpha = 0
			}
		}

		state = {
			name = "stress_level_increase"
			next = "fade_out"

			duration = 0.1
			bezier = { 0.5 0 1 0.5 }

			modify_texture = {
				name = "flash"
				alpha = 0.6
			}
		}

		state = {
			name = "stress_increase"
			next = "fade_out"

			duration = 0.1
			bezier = { 0.5 0 1 0.5 }

			modify_texture = {
				name = "flash"
				alpha = 0.6
			}
		}

		state = {
			name = "fade_out"

			duration = 0.8
			bezier = { 0 0.5 0.5 1 }


			modify_texture = {
				name = "flash"
				alpha = 0
			}
		}

		state = {
			name = a
			next = b
			trigger_on_create = yes

			modify_texture = {
				name = "clouds"
				translate_uv = { 1 0 }
			}
		}

		state = {
			name = b
			next = a
			duration = 15

			modify_texture = {
				name = "clouds"
				translate_uv = { -1 0 }
			}
		}
	}

	type button_raise_disband_armies = button_standard {
		size = { 200 64 }
		datacontext = "[GetPlayer]"
		parentanchor = vcenter

		background = {
			using = Background_Area_Dark_Border
		}

		background = {
			using = Background_Area_Dark
		}

		margin_left = 45


		block "text" {
			text = "RAISE_ALL"
		}

		using = tooltip_ne

		icon = {
			texture = "gfx/interface/icons/icon_banner.dds"
			size = { 40 40 }
			alwaystransparent = yes
			parentanchor = left|vcenter
			position = { 10 0 }
		}

		state = {
			name = _show
			using = Animation_FadeIn_Quick
			position_y = 0
		}

		state = {
			name = _hide
			using = Animation_FadeOut_Quick
			position_y = 20
		}
	}

	type button_hud_travel = button_standard {
		size = { 170 36 }
		datacontext = "[GetPlayer]"
		parentanchor = vcenter

		background = {
			using = Background_Area_Dark_Border
		}

		margin_left = 34

		using = tooltip_ne

		icon = {
			texture = "gfx/interface/icons/travel/icon_travel_hud_placeholder.dds"
			size = { 30 30 }
			alwaystransparent = yes
			parentanchor = left|vcenter
			position = { 8 0 }
		}

		state = {
			name = _show
			using = Animation_FadeIn_Quick
			position_y = 0
		}

		state = {
			name = _hide
			using = Animation_FadeOut_Quick
			position_y = 20
		}
	}

	type button_war_banner = button_normal {
		visible = "[Not(IsGameViewOpen('barbershop'))]"
		size = { 78 82 }
		onclick = "[WarItem.OnClick]"
		tooltip = "[WarItem.GetTooltip]"
		using = tooltip_ne

		animation_sonar = {
			visible = "[WarItem.CanEnforceVictory]"
			texture = "gfx/interface/component_masks/mask_glow.dds"
			using = Color_Orange
		}

		##Show animation
		state = {
			name = _show
			next = banner_default
			using = Animation_FadeIn_Quick
			bezier = { 1 0 0.5 0.5 }
			size = { 86 88 }
			alpha = 1
			trigger_on_create = yes
		}

		state = {
			name = banner_default
			using = Animation_FadeIn_Standard
			size = { 78 82 }
		}

		state = {
			name = _hide
			using = Animation_FadeOut_Standard
			bezier = { 1 0 0.5 0.5 }
			size = { 66 70 }
			alpha = 0
		}

		icon = {
			name = "enforce_victory_glow"
			visible = "[WarItem.CanEnforceVictory]"
			parentanchor = center
			size = { 100% 100% }
			scale = 1.2
			texture = "gfx/interface/icons/war_status/war_won_glow.dds"

			state = {
				trigger_on_create = yes
				name = a
				next = b

				using = Animation_Curve_Default
				duration = 1
				alpha = 1
			}

			state = {
				name = b
				next = a

				using = Animation_Curve_Default
				duration = 1.6
				alpha = 0.2
			}
		}

		button = {
			name = "enforce_victory_icon"
			visible = "[WarItem.CanEnforceVictory]"
			parentanchor = hcenter
			position = { 0 -27 }
			texture = "gfx/interface/icons/war_status/war_won_icon.dds"

			modify_texture = {
				name = "shimmer_war_banner"
				texture = "gfx/interface/component_effects/effect_shimmer.dds"
				blend_mode = colordodge
				translate_uv = { 1 1 }
				alpha = 0.8
			}

			state = {
				name = shimmer
				next = pause
				trigger_when = "[WarItem.CanEnforceVictory]"
				delay = 0.5
				bezier = { 0 0.9 1 0.4 }

				modify_texture = {
					name = "shimmer_war_banner"
					translate_uv = { 1 0.8 }
					alpha = 0.5
				}
			}

			state = {
				name = pause
				duration = 0.8

				modify_texture = {
					name = "shimmer_war_banner"
					translate_uv = { -1 -1 }
					alpha = 0.5
				}
			}
		}

		highlight_icon = {
			name = "war_icon"
			visible = "[WarItem.IsPlayerParticipant]"
			parentanchor = center
			size = { 100% 100% }
			texture = "gfx/interface/icons/war_status/war_icon.dds"

			modify_texture = {
				name = "shimmer_war_banner"
				texture = "gfx/interface/component_effects/effect_shimmer.dds"
				blend_mode = colordodge
				translate_uv = { 1 1 }
			}

			state = {
				name = shimmer
				next = pause
				trigger_when = "[WarItem.CanEnforceVictory]"
				delay = 0.5
				bezier = { 0 0.9 1 0.4 }

				modify_texture = {
					name = "shimmer_war_banner"
					translate_uv = { 1 0.5 }
					alpha = 0.5
				}
			}

			state = {
				name = pause
				duration = 0.8

				modify_texture = {
					name = "shimmer_war_banner"
					translate_uv = { -1 -1 }
					alpha = 0.5
				}
			}
		}

		highlight_icon = {
			name = "war_icon_liege"
			visible = "[Not(WarItem.IsPlayerParticipant)]"
			parentanchor = center
			size = { 100% 100% }
			texture = "gfx/interface/icons/war_status/war_icon_liege.dds"
		}

		coa_realm_small = {
			name = "enemy_realm"
			datacontext = "[WarItem.GetWar.GetPrimaryPlayerEnemy]"
			parentanchor = hcenter
			scale = 0.9
			position = { 0 12 }
			tooltip_visible = no
			alwaystransparent = yes
		}

		text_single = {
			name = "warscore"
			parentanchor = bottom|hcenter
			position = { 0 -7 }
			size = { 50 10 }
			align = center
			text = "[WarItem.GetWarScoreFraction|0%=+]"
		}

		widget = {
			visible = "[WarItem.CanEnforceVictory]"

			state = {
				name = _show

				start_sound = {
					soundeffect = "event:/SFX/UI/War/sfx_ui_war_enforce_demand"
					soundparam = {
						name = StateChange
						value = 1.5
					}
				}
			}
		}
	}

	type button_struggle_banner = button_normal {
		name = "struggle_banner_tutorial_uses_this"

		size = { 110 110 }

		onclick = "[ToggleGameViewData('struggle', Struggle.GetID)]"

		onmousehierarchyenter = "[HighlightStruggle( Struggle.Self )]"
		onmousehierarchyleave = "[ClearHighlightedStruggleBorder]"

		state = {
			name = _show
			next = banner_default
			using = Animation_FadeIn_Quick
			bezier = { 1 0 0.5 0.5 }
			size = { 80 80 }
			alpha = 1
			trigger_on_create = yes
		}

		state = {
			name = banner_default
			using = Animation_FadeIn_Standard
			size = { 110 110 }
		}

		state = {
			name = _hide
			using = Animation_FadeOut_Standard
			bezier = { 1 0 0.5 0.5 }
			size = { 80 80 }
			alpha = 0
		}

		# Animations
		struggle_phase_based_widget = {
			datacontext = "[Struggle.GetCurrentPhase]"
			visible = "[Struggle.HasPossibleEndingDecision]"
			parentanchor = center

			animation_sonar = {
				texture = "gfx/interface/component_masks/mask_glow.dds"
				using = Color_Orange
			}

			blockoverride "point_based_widget_content" {
				icon = {
					size = { 100% 100% }
					position = { 0 -12 }
					texture = "gfx/interface/icons/struggle_banners/upper_point_glow.dds"

					state = {
						trigger_on_create = yes
						name = a
						next = b

						using = Animation_Curve_Default
						duration = 1
						alpha = 1
					}

					state = {
						name = b
						next = a

						using = Animation_Curve_Default
						duration = 1.6
						alpha = 0.2
					}
				}
			}

			blockoverride "time_based_widget_content" {
				icon = {
					position = { 0 -12 }
					size = { 100% 100% }
					texture = "gfx/interface/icons/struggle_banners/upper_time_glow.dds"

					state = {
						trigger_on_create = yes
						name = a
						next = b

						using = Animation_Curve_Default
						duration = 1
						alpha = 1
					}

					state = {
						name = b
						next = a

						using = Animation_Curve_Default
						duration = 1.6
						alpha = 0.2
					}
				}
			}
		}

		# Leading phase
		struggle_phase_based_widget = {
			datacontext = "[Struggle.GetCurrentLeadingPhase]"

			blockoverride "point_based_widget_content" {
				icon = {
					size = { 100% 100% }
					texture = "gfx/interface/icons/struggle_banners/lower_point_banner.dds"
				}
			}

			blockoverride "time_based_widget_content" {
				icon = {
					size = { 100% 100% }
					texture = "gfx/interface/icons/struggle_banners/lower_time_banner.dds"
				}
			}

			blockoverride "ending_widget_content" {
				icon = {
					size = { 100% 100% }
					texture = "gfx/interface/icons/struggle_banners/lower_ending_banner.dds"
				}

				icon = {
					size = { 100% 100% }
					texture = "gfx/interface/component_effects/ending_banner_fire_01.dds"
					alpha = 0.25

					state = {
						trigger_on_create = yes
						name = a
						next = b

						using = Animation_Curve_Default
						duration = 1
						alpha = 0.25
					}

					state = {
						name = b
						next = a

						using = Animation_Curve_Default
						duration = 1
						alpha = 0
					}
				}

				icon = {
					size = { 100% 100% }
					texture = "gfx/interface/component_effects/ending_banner_fire_02.dds"
					alpha = 0

					state = {
						trigger_on_create = yes
						name = a
						next = b

						using = Animation_Curve_Default
						duration = 1
						alpha = 0
					}

					state = {
						name = b
						next = a

						using = Animation_Curve_Default
						duration = 1
						alpha = 0.25
					}
				}

				icon = {
					name = "ending_phase_glow"
					visible = "[Struggle.HasPossibleEndingDecision]"
					parentanchor = center
					size = { 100% 100% }
					texture = "gfx/interface/icons/struggle_banners/lower_ending_glow.dds"

					state = {
						trigger_on_create = yes
						name = a
						next = b

						using = Animation_Curve_Default
						duration = 1
						alpha = 0.5
					}

					state = {
						name = b
						next = a

						using = Animation_Curve_Default
						duration = 1.6
						alpha = 0.2
					}
				}
			}

			widget = {
				visible = "[Struggle.GetCurrentLeadingPhase.IsValid]"
				parentanchor = bottom|left
				size = { 25 25  }
				position = { 20 -14 }
			}
		}

		# Tie
		icon = {
			visible = "[Not(Struggle.GetCurrentLeadingPhase.IsValid)]"
			size = { 100% 100% }
			texture = "gfx/interface/icons/struggle_banners/lower_tied_banner.dds"
		}

		# Current phase
		struggle_phase_based_widget = {
			datacontext = "[Struggle.GetCurrentPhase]"
			blockoverride "point_based_widget_content" {
				struggle_highlight_icon = {
					visible = "[Struggle.IsInvolvedCharacter(Character.Self)]"
					blockoverride "texture" {
						texture = "gfx/interface/icons/struggle_banners/upper_point_involved_banner.dds"
					}
				}

				struggle_highlight_icon = {
					visible = "[Struggle.IsInterloperCharacter(Character.Self)]"
					blockoverride "texture" {
						texture = "gfx/interface/icons/struggle_banners/upper_point_interloper_banner.dds"
					}
				}

				widget = {
					size = { 52 52 }
					position = { 0 15 }
					parentanchor = top|hcenter

					icon = {
						size = { 52 52 }
						parentanchor = center
						texture = "gfx/interface/icons/struggle_banners/icon_background_02.dds"
					}

					icon = {
						parentanchor = center
						size = { 40 40 }
						texture = "[Struggle.GetCurrentPhase.GetIcon]"
					}
				}

				progressbar_standard = {
					size = { 60 12 }
					parentanchor = bottom|hcenter
					position = { 0 -20 }
					value = "[Struggle.GetProgress]"
					progresstexture = "gfx/interface/progressbars/progress_orange.dds"
				}

				widget_struggle_hourglass = { }
			}

			blockoverride "time_based_widget_content" {
				struggle_highlight_icon = {
					visible = "[Struggle.IsInvolvedCharacter(Character.Self)]"
					blockoverride "texture" {
						texture = "gfx/interface/icons/struggle_banners/upper_time_involved_banner.dds"
					}
				}

				struggle_highlight_icon = {
					size = { 100% 100% }
					visible = "[Struggle.IsInterloperCharacter(Character.Self)]"
					blockoverride "texture" {
						texture = "gfx/interface/icons/struggle_banners/upper_time_interloper_banner.dds"
					}
				}

				widget = {
					size = { 52 52 }
					parentanchor = top|hcenter
					position = { 1 18 }

					icon = {
						parentanchor = center
						texture = "gfx/interface/icons/struggle_banners/icon_background_02.dds"
						size = { 60 60 }
					}

					progresspie = {
						name = "progress"
						parentanchor = center
						size = { 52 52 }
						position = { 0 -1}
						texture = "gfx/interface/progressbars/action_progress_thin.dds"
						framesize = { 124 124 }
						frame = 2
						value = "[Struggle.GetProgress]"
					}

					icon = {
						parentanchor = center
						size = { 40 40 }
						texture = "[Struggle.GetCurrentPhase.GetIcon]"
					}
				}

				widget_struggle_hourglass = { }

				text_single = {
					text = "[Struggle.GetPhaseValue(Struggle.GetCurrentLeadingPhase)]"
					default_format = "#high"
					parentanchor = bottom|hcenter
					position = { 0 -14 }
				}
			}
		}

		widget = {
			size = { 80 110 }
			tooltipwidget = struggle_tooltip
			parentanchor = center
		}
	}

	type struggle_highlight_icon = highlight_icon {
		size = { 100% 100% }
		block "texture" {}

		##Pulse glow
		glow = {
			name = "glow_defined"
			glow_radius = 3
			using = Glow_Standard
			using = Color_Orange
			glow_alpha = 0
		}

		state = {
			name = struggle_pulse_glow
			next = struggle_pulse_glow_stop
			using = Animation_FadeIn_Quick
			bezier = { 1 0 0.5 0.5 }
			glow_alpha = 1
		}

		state = {
			name = struggle_pulse_glow_stop
			bezier = { 1 0 0.5 0.5 }
			duration = 0.3
			glow_alpha = 0
		}

		#white fill
		state = {
			name = struggle_pulse_icon
			next = struggle_pulse_icon_stop
			using = Animation_FadeIn_Quick
			bezier = { 1 0 0.5 0.5 }

			modify_texture = {
				name = "white_icon"
				alpha = 1
			}
		}

		state = {
			name = struggle_pulse_icon_stop
			bezier = { 1 0 0.5 0.5 }
			duration = 0.3

			modify_texture = {
				name = "white_icon"
				alpha = 0
			}
		}

		modify_texture = {
			name = "white_icon"
			texture = "gfx/interface/component_masks/mask_rough_edges.dds"
			blend_mode = colordodge
			alpha = 0
		}
	}

	type widget_struggle_hourglass = widget {
		visible = "[Struggle.IsInTransitionPhase]"
		position = { 0 0 }
		size = { 32 32 }

		icon = {
			parentanchor = center
			size = { 32 32 }
			texture = "gfx/interface/icons/struggle_banners/icon_background_dark.dds"

			#white fill
			state = {
				name = struggle_pulse_icon
				next = struggle_pulse_icon_stop
				using = Animation_FadeIn_Quick
				bezier = { 1 0 0.5 0.5 }

				modify_texture = {
					name = "white_icon"
					alpha = 1
				}
			}

			state = {
				name = struggle_pulse_icon_stop
				bezier = { 1 0 0.5 0.5 }
				duration = 0.3

				modify_texture = {
					name = "white_icon"
					alpha = 0
				}
			}

			modify_texture = {
				name = "white_icon"
				texture = "gfx/interface/component_masks/mask_rough_edges.dds"
				blend_mode = colordodge
				alpha = 0
			}
		}

		icon = {
			parentanchor = center
			size = { 30 30 }
			texture = "gfx/interface/icons/icon_time.dds"

			#white fill
			state = {
				name = struggle_pulse_icon
				next = struggle_pulse_icon_stop
				using = Animation_FadeIn_Quick
				bezier = { 1 0 0.5 0.5 }

				modify_texture = {
					name = "white_icon"
					alpha = 1
				}
			}

			state = {
				name = struggle_pulse_icon_stop
				bezier = { 1 0 0.5 0.5 }
				duration = 0.3

				modify_texture = {
					name = "white_icon"
					alpha = 0
				}
			}

			modify_texture = {
				name = "white_icon"
				texture = "gfx/interface/component_masks/mask_rough_edges.dds"
				blend_mode = colordodge
				alpha = 0
			}
		}
	}

	type button_ghw_banner = button_normal {
		size = { 78 82 }
		onclick = "[OpenGameViewData( 'great_holy_war', GreatHolyWar.GetID )]"

		block "ghw_tooltip"
		{
			raw_tooltip = "#D no tooltip :(#!"
		}

		##Show animation
		state = {
			name = _show
			next = banner_default
			using = Animation_FadeIn_Quick
			bezier = { 1 0 0.5 0.5 }
			size = { 86 88 }
			alpha = 1
			trigger_on_create = yes
		}

		state = {
			name = banner_default
			using = Animation_FadeIn_Standard
			size = { 78 82 }
		}

		state = {
			name = _hide
			using = Animation_FadeOut_Standard
			bezier = { 1 0 0.5 0.5 }
			size = { 66 70 }
			alpha = 0
		}

		button = {
			name = "holy_war_icon_started"
			visible = "[GreatHolyWar.HasWarStarted]"
			onclick = "[OpenGameViewData( 'great_holy_war', GreatHolyWar.GetID )]"
			parentanchor = center
			size = { 100% 100% }
			texture = "gfx/interface/icons/war_status/holy_war_icon_started.dds"
		}

		button = {
			name = "holy_war_icon_prep"
			visible = "[Not(GreatHolyWar.HasWarStarted)]"
			onclick = "[OpenGameViewData( 'great_holy_war', GreatHolyWar.GetID )]"
			parentanchor = center
			size = { 100% 100% }
			texture = "gfx/interface/icons/war_status/holy_war_icon_prep.dds"
		}

		button = {
			name = "faith_icon"
			datacontext = "[GreatHolyWar.GetFaith]"
			onclick = "[OpenGameViewData( 'great_holy_war', GreatHolyWar.GetID )]"
			parentanchor = center
			position = { 1 -3 }
			size = { 35 35 }
			texture = "[Faith.GetIcon]"
		}
	}

	type button_situation_banner = button_normal {
		visible = "[Not( Situation.UsesMigration )]"

		size = { 110 110 }

		onclick = "[ToggleGameViewData(Situation.GetWindowName, Situation.GetID)]"

		#onmousehierarchyenter = "[HighlightSituation( Situation.Self )]"
		#onmousehierarchyleave = "[ClearHighlightedSituationBorder]"

		# Current phase
		widget = {
			size = { 100% 100% }
			datacontext = "[Situation.GetTopCurrentPhase]"


			icon = {
				size = { 100% 100% }
				texture = "gfx/interface/icons/struggle_banners/lower_point_banner.dds"
			}
			icon = {
				size = { 100% 100% }
				texture = "gfx/interface/icons/struggle_banners/upper_point_involved_banner.dds"
			}

			widget = {
				size = { 52 52 }
				position = { 0 15 }
				parentanchor = top|hcenter

				icon = {
					size = { 52 52 }
					parentanchor = center
					texture = "gfx/interface/icons/struggle_banners/icon_background_02.dds"
				}

				icon = {
					parentanchor = center
					size = { 40 40 }
					texture = "[Situation.GetType.GetIcon]"
				}
			}

			progressbar_standard = {
				size = { 60 12 }
				parentanchor = bottom|hcenter
				position = { 0 -20 }
				value = "[Situation.GetTopCurrentPhase.GetRelativeProgress]"
				max = 1

				progresstexture = "gfx/interface/progressbars/progress_orange.dds"
			}
		}

		widget = {
			size = { 80 110 }
			tooltipwidget = situation_tooltip
			using = tooltip_nw
		}
	}

	type button_raid_banner = button_normal {
		size = { 78 82 }
		onclick = "[DefaultOnCharacterClick(Character.GetID)]"
		using = tooltip_ne

		##Show animation
		state = {
			name = _show
			next = banner_default
			using = Animation_FadeIn_Quick
			bezier = { 1 0 0.5 0.5 }
			size = { 86 88 }
			alpha = 1
			trigger_on_create = yes
		}

		state = {
			name = banner_default
			using = Animation_FadeIn_Standard
			size = { 78 82 }
		}

		state = {
			name = _hide
			using = Animation_FadeOut_Standard
			bezier = { 1 0 0.5 0.5 }
			size = { 66 70 }
			alpha = 0
		}

		highlight_icon = {
			texture = "gfx/interface/icons/war_status/raid_icon.dds"
			size = { 100% 100% }
			parentanchor = center
		}

		coa_realm_small = {
			name = "enemy_realm"
			parentanchor = hcenter
			scale = 0.9
			position = { 0 12 }
			tooltip_visible = no
			alwaystransparent = yes
		}

		text_single = {
			name = "time_left"
			parentanchor = bottom|hcenter
			position = { 0 -7 }
			size = { 50 10 }
			align = center
			text = "[GetPlayer.GetRaidHostilityEnd( Character.Self ).GetTimeDiffFromNow]"

		}
	}

	type button_hud_character_bar = button_normal {
		effectname = "NoHighlight"

		framesize = { 103 102}
		size = { 52 52 }
		texture = "gfx/interface/skinned/button_hud_character_sidebar.dds"
		using = tooltip_ne

		state = {
			name = _show
			frame = 1
			position_x = 0

			using = Animation_Curve_Default
			duration = 0.25
		}

		state = {
			name = _mouse_hierarchy_enter
			frame = 2
			position_x = 3

			using = Animation_Curve_Default
			duration = 0.1
		}

		state = {
			name = _mouse_leave
			frame = 1
			position_x = 0

			using = Animation_Curve_Default
			duration = 0.25
		}

		state = {
			name = _mouse_press
			frame = 3
			position_x = 3
		}

		state = {
			name = _mouse_release
			frame = 2
			position_x = 0

			using = Animation_Curve_Default
			duration = 0.25
		}
	}

	type widget_hud_main_tab = widget {
		size = { 45 45 }
		using = tooltip_ws
		tooltip_offset = { 35 0 }

		button_normal = {
			parentanchor = center
			size = { 45 45 }

			scale = 1

			block "maintab_button" {}

			modify_texture = {
				name = "glow"
				texture = "gfx/interface/component_effects/effect_shimmer.dds"
				blend_mode = colordodge
				translate_uv = { 1 0 }
				alpha = 0
			}

			state = {
				name = _mouse_enter
				duration = 0.03
				scale = 1.2
				position_x = -3

				using = Animation_Curve_Default

				modify_texture = {
					name = "glow"
					translate_uv = { 0 0 }
					alpha = 0.4
				}
			}

			state = {
				name = _mouse_leave
				duration = 0.1
				scale = 1
				position_x = 0

				using = Animation_Curve_Default

				modify_texture = {
					name = "glow"
					translate_uv = { 1 0 }
					alpha = 0
				}
			}
		}
	}

	type hotkeys_HUD = widget {
		# Mapmodes
		button_normal = {
		  onclick = "[SetMapMode('players_0')]"
		  shortcut = "map_mode_8"
		  enabled = "[Or(GameHasMultiplePlayers, InDebugMode)]"
		}

		button_normal = {
		  onclick = "[SetMapMode('dejure_duchies_0')]"
		  shortcut = "map_mode_9"
		  shortcut = "mapmode_duchies_secondary"
		}

		button_normal = {
		  onclick = "[SetMapMode('dejure_kingdoms_0')]"
		  shortcut = "map_mode_10"
		  shortcut = "mapmode_kingdoms_secondary"

		}

		button_normal = {
		  onclick = "[SetMapMode('dejure_empires_0')]"
		  shortcut = "map_mode_11"
		  shortcut = "mapmode_empires_secondary"
		}

		button_normal = {
		  onclick = "[SetMapMode('religions_0')]"
		  shortcut = "map_mode_3"
		  shortcut = "mapmode_faith_secondary"
		}

		button_normal = {
		  onclick = "[SetMapMode('cultures_0')]"
		  shortcut = "map_mode_2"
		  shortcut = "mapmode_culture_secondary"
		}

		button_normal = {
		  onclick = "[SetMapMode('houses_0')]"
		  shortcut = "map_mode_4"
		  shortcut = "mapmode_house_secondary"
		}

		button_normal = {
		  onclick = "[SetMapMode('realms_0')]"
		  onclick = "[ClearExploringRealms]"
		  shortcut = "map_mode_1"
		}

		button_normal = {
		  onclick = "[SetMapMode('government_0')]"
		  shortcut = "map_mode_5"
		}

		button_normal = {
		  onclick = "[SetMapMode('epidemics_0')]"
		  shortcut = "map_mode_16"
		}

		button_normal = {
		  onclick = "[SetMapMode('legends_0')]"
		  shortcut = "map_mode_17"
		}

		button_normal = {
		  onclick = "[SetMapMode('dejure_counties_0')]"
		  shortcut = "map_mode_6"
		}

		button_normal = {
		  onclick = "[SetMapMode('court_languages_0')]"
		  shortcut = "map_mode_7"
		}

		button_normal = {
		  onclick = "[SetMapMode('simple_terrain_0')]"
		  shortcut = "map_mode_12"
		}

		button_normal = {
		  onclick = "[SetMapMode('county_development_0')]"
		  shortcut = "map_mode_13"
		}

		button_normal = {
		  onclick = "[SetMapMode( 'economy_buildings' )]"
		  shortcut = "map_mode_14"
		}

		button_normal = {
		  onclick = "[SetMapMode( 'county_control' )]"
		  shortcut = "map_mode_15"
		}

		button_normal = {
			name = "find_title_shortcut"
			onclick = "[ToggleGameView( 'find_title' )]"
			onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
			shortcut = "find_title_shortcut"
		}

		button_normal = {
			name = "plagues_shortcut"
			onclick = "[ToggleGameView( 'epidemics' )]"
			onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
			shortcut = "explore_plagues"
		}

		button_normal = {
			name = "legends_shortcut"
			onclick = "[ToggleGameView( 'legends' )]"
			onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
			shortcut = "explore_legends"
		}

		# 0 size button for shortcut to work
		button_normal = {
			name = "find_character_shortcut"
			onclick = "[ToggleGameView( 'character_finder' )]"
			onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
			shortcut = "character_finder"
		}

		# 0 size button for shortcut to work
		button_normal = {
			name = "encyclopedia_shortcut"
			onclick = "[ToggleEncyclopedia]"
			onclick = "[GetVariableSystem.Clear( 'extra_buttons_expand' )]"
			shortcut = "encyclopedia"
		}
	}

	type button_pause_hud = button_round {
		size = { 33 33 }

		enabled = "[Not(IsGameOver)]"
		onclick = "[OnPause]"
		oversound = "event:/SFX/UI/Generic/sfx_ui_generic_pointer_over"
		clicksound = "event:/SFX/UI/Generic/sfx_ui_generic_select"

		button_play = {
			visible = "[IsGamePaused]"
			size = { 35 35 }

			tooltip = "[SelectLocalization( IsGameOver, 'UNPAUSE_GAME_OVER', 'UNPAUSE_GAME')]"
			using = tooltip_ne
			alwaystransparent = yes
			parentanchor = center
		}

		button_pause = {
			visible = "[Not(IsGamePaused)]"
			size = { 35 35 }

			tooltip = "PAUSE_GAME"
			using = tooltip_ne
			alwaystransparent = yes
			parentanchor = center
		}
	}

	type container_resource_balance = container {
		text_single = {
			name = "balance_pos"
			visible = "[GreaterThanOrEqualTo_CFixedPoint(PlayerValueItem.GetBalance, '(CFixedPoint)0')]"
			text = "[PlayerValueItem.GetBalance|1=]"
			max_width = 110

			default_format = "#low"
		}

		text_single = {
			name = "balance_neg"
			visible = "[LessThan_CFixedPoint(PlayerValueItem.GetBalance, '(CFixedPoint)0')]"
			text = "[PlayerValueItem.GetBalance|1=]"
			max_width = 110

			default_format = "#N"
		}
	}

	type container_saving_indicator = container {
		visible = yes

		background = {
			name = "bg"
			texture = "gfx/interface/tooltips/tooltip_bg.dds"
			spriteType = Corneredtiled
			gfxtype = icongfx
			spriteborder = { 2 2 }
			shaderfile = "gfx/FX/pdxgui_default.shader"

		}

		background = {
			name = "frame"
			texture = "gfx/interface/tooltips/tooltip_frame.dds"
			gfxtype = icongfx
			spriteType = Corneredtiled
			spriteborder = { 20 20 }
			shaderfile = "gfx/FX/pdxgui_default.shader"


			modify_texture = {
				name = "overlay"
				texture = "gfx/interface/component_overlay/overlay_window.dds"
				spriteType = Corneredstretched
				spriteborder = { 0 0 }
				blend_mode = overlay
			}
		}

		flowcontainer = {
			spacing = 15
			margin = { 20 15 }

			progressbar = {
				size = { 44 44 }
				gfxtype = framedprogressbargfx
				texture = "gfx/interface/frontend/loading_progress.dds"
				framesize = { 88 88 }
				loopinterval = 2.0
				max = 0
			}

			text_single = {
				parentanchor = vcenter
				align = nobaseline
				using = Font_Size_Medium

				block "csi_text"
				{
					text = "AUTOSAVE_IN_PROGRESS"
				}
			}
		}
	}

	type resources_top_right_bar = hbox
	{
		layer = top

		using = Animation_ShowHide_Quick

		## Resources
		hbox = {
			name = "resources"
			visible = "[Not( IsGameViewOpen('barbershop') )]"

			hbox = {
				name = "spendables"
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding

				hbox = {
					name = "tutorial_highlight_resources_bar"
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding

					widget = {
						name = "gold"
						size = { 144 70 }

						widget = {
							size = { 144 45 }

							tooltipwidget = {
								widget_gold_breakdown_tooltip = {
									blockoverride "income"
									{
										datacontext = "[InGameTopbar.GetIncomeBalanceBreakdown]"
									}

									blockoverride "expenses"
									{
										datacontext = "[InGameTopbar.GetExpensesBalanceBreakdown]"
									}
								}
							}
							using = tooltip_ne
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_start.dds"
						}

						vbox = {
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 7

									icon = {
										name = "gold_icon"
										size = { 30 30 }
										texture = "gfx/interface/icons/icon_gold.dds"
									}

									flowcontainer = {
										margin_bottom = 7
										spacing = -6
										direction = vertical
										ignoreinvisible = yes

										text_single = {
											name = "gold_value_positive"
											visible = "[GreaterThanOrEqualTo_CFixedPoint(GetPlayer.GetGold, '(CFixedPoint)0')]"
											text = "[GetPlayer.GetGold|0]"
											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										text_single = {
											name = "gold_value_negative"
											visible = "[LessThan_CFixedPoint(GetPlayer.GetGold, '(CFixedPoint)0')]"
											text = "[GetPlayer.GetGold|0]"
											max_width = 50
											default_format = "#N"
											using = Font_Size_Medium
										}

										container = {
											text_single = {
												name = "balance_positive"
												visible = "[GreaterThanOrEqualTo_CFixedPoint(GetPlayerBalance, '(CFixedPoint)0')]"
												text = "CURRENT_BALANCE"
												max_width = 50
												default_format = "#low"
											}

											text_single = {
												name = "balance_negative"
												visible = "[LessThan_CFixedPoint(GetPlayerBalance, '(CFixedPoint)0')]"
												text = "CURRENT_BALANCE"
												max_width = 50
												default_format = "#N"
											}
										}
									}
								}
								spacer = {
									size = { 10 1}
								}
								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}
						}
					}

					widget = {
						name = "prestige"
						datacontext = "[InGameTopbar.GetPrestigeItem]"

						widget = {
							size = { 112 45 }

							tooltipwidget = {
								widget_resource_value_tooltip = {}
							}
							using = tooltip_ne
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece.dds"
						}
						size = { 112 70 }

						vbox = {
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 7

									icon = {
										name = "prestige_icon"
										size = { 30 30 }
										texture = "[GetPlayer.GetPrestigeLevelTexture]"
									}

									flowcontainer = {
										margin_bottom = 7
										spacing = -6
										direction = vertical

										text_single = {
											name = "prestige_value"
											text = "[GetPlayer.GetPrestige|0]"
											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										container_resource_balance = {}
									}
								}

								expand = {}

								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}
						}
					}



					widget = {
						name = "piety"
						datacontext = "[InGameTopbar.GetPietyItem]"
						button = {
							size = { 112 45 }
							onclick = "[OpenGameViewData( 'faith', GetPlayer.GetFaith.GetID )]"

							using = tooltip_ne
							tooltipwidget = {
								widget_resource_value_tooltip = {}
							}
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece.dds"
						}
						size = { 112 70 }

						vbox = {
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 6

									icon = {
										name = "piety_icon"
										size = { 30 30 }
										texture = "[GetPlayer.GetPietyLevelTexture]"
									}

									flowcontainer = {
										margin_bottom = 7
										spacing = -6
										direction = vertical

										text_single = {
											name = "piety_value"
											text = "[GetPlayer.GetPiety|0]"

											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										container_resource_balance = {}
									}
								}

								expand = {}

								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}
						}
					}


					widget = {
						name = "provisions"
						visible = "[IsLandlessAdventurer( GetPlayer )]"
						size = { 112 70 }

						widget = {
							datacontext = "[GetPlayer.GetDomicile]"
							size = { 112 45 }

							tooltip = "[Domicile.GetProvisionsBreakdown]"
							using = tooltip_ne
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece.dds"
						}

						vbox = {
							datacontext = "[GetPlayer.GetDomicile]"
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 7

									icon = {
										name = "provisions_icon"
										size = { 30 30 }

										framesize = { 60 60 }
										frame = 0
										texture = "gfx/interface/icons/icon_camp_supply.dds"
									}

									flowcontainer = {
										margin_bottom = 7
										spacing = -6
										direction = vertical
										ignoreinvisible = yes

										text_single = {
											name = "provisions_value_positive"
											visible = "[Not( Or( Domicile.IsProvisionsLow, Domicile.IsProvisionsCritical ) )]"

											text = "[Domicile.GetProvisions|0]"
											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										text_single = {
											name = "provisions_value_low"
											visible = "[Domicile.IsProvisionsLow]"

											text = "[Domicile.GetProvisions|0]"
											max_width = 50
											default_format = "#color_yellow"
											using = Font_Size_Medium
										}

										text_single = {
											name = "provisions_value_critical"
											visible = "[Domicile.IsProvisionsCritical]"

											text = "[Domicile.GetProvisions|0]"
											max_width = 50
											default_format = "#N"
											using = Font_Size_Medium
										}

										container = {
											text_single = {
												name = "provisions_max"
												text = "[Domicile.GetProvisionsMax]"
												max_width = 50
												default_format = "#low"
											}
										}
									}
								}
								expand = {}
								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}

							hbox = {
								layoutpolicy_horizontal = expanding
								spacing = 6


								vbox = {
									margin_top = -2
									layoutpolicy_vertical = expanding

									expand = {}
								}
							}
							expand = {}
						}
					}

					widget = {
						name = "influence"
						datacontext = "[InGameTopbar.GetInfluenceItem]"

						visible = "[GetPlayer.GetGovernment.HasRule( 'administrative' )]"

						widget = {
							size = { 112 45 }

							tooltipwidget = {
								widget_resource_value_tooltip = {}
							}
							using = tooltip_ne
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece.dds"
						}
						size = { 112 70 }

						vbox = {
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 7

									icon = {
										name = "influence_icon"
										size = { 30 30 }
										texture = "[GetPlayer.GetInfluenceLevelTexture]"
									}

									flowcontainer = {
										margin_bottom = 7
										spacing = -6
										direction = vertical

										text_single = {
											name = "influence_value"
											text = "[GetPlayer.GetInfluence|0]"
											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										container_resource_balance = {}
									}
								}

								expand = {}

								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}
						}
					}

					widget = {
						name = "renown"
						datacontext = "[InGameTopbar.GetDynastyPrestigeItem]"
						layoutpolicy_vertical = expanding

						button = {
							size = { 112 45 }
							onclick = "[DefaultOnHouseCoatOfArmsClick(GetPlayer.GetHouse.GetID)]"

							using = tooltip_ne
							tooltipwidget = {
								widget_resource_value_tooltip = {}
							}
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece.dds"
						}
						size = { 112 70 }

						vbox = {
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 6

									icon = {
										visible = "[GetPlayer.IsDynast]"
										texture = "[GetPlayer.GetDynasty.GetDynastyPrestigeLevelTexture]"
										size = { 30 30 }
									}

									icon = {
										visible = "[Not(GetPlayer.IsDynast)]"
										texture = "[GetPlayer.GetDynasty.GetDynastyPrestigeLevelTexture]"
										size = { 30 30 }
										alpha = 0.3
									}

									flowcontainer = {
										visible = "[GetPlayer.IsDynast]"
										margin_bottom = 7
										spacing = -6
										direction = vertical

										text_single = {
											name = "prestige_value"
											text = "[GetPlayer.GetDynasty.GetPrestige|0]"

											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										container_resource_balance = {}
									}

									flowcontainer = {
										visible = "[Not(GetPlayer.IsDynast)]"
										margin_bottom = 7
										spacing = -6
										direction = vertical

										text_single = {
											name = "prestige_value_nodynast"
											text = "[GetPlayer.GetDynasty.GetPrestige|0]"

											max_width = 50
											default_format = "#low"
											using = Font_Size_Medium
										}

										container_resource_balance = {}
									}
								}

								expand = {}

								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}
						}
					}

					widget = {
						name = "herd"
						datacontext = "[GetPlayer]"
						datacontext = "[Character.GetDomicile]"
						visible = "[IsNomad( GetPlayer )]"
						size = { 112 70 }

						widget = {
							size = { 112 45 }
							using = tooltip_ne

							tooltipwidget = {
								herd_breakdown_hud_toolip = {}
							}
						}

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece.dds"
						}

						vbox = {
							margin_top = -2

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 7

									icon = {
										name = "herd_icon"
										size = { 30 30 }

										texture = "gfx/interface/icons/icon_herd.dds"
									}

									flowcontainer = {
										margin_bottom = 7
										spacing = -6
										direction = vertical
										ignoreinvisible = yes

										text_single = {
											name = "herd_value_positive"
											visible = "[Not( Domicile.IsAboveHerdLimit )]"

											text = "[Domicile.GetHerd|0]"
											max_width = 50
											default_format = "#high"
											using = Font_Size_Medium
										}

										text_single = {
											name = "above_herd_limit"
											visible = "[Domicile.IsAboveHerdLimit]"

											text = "[Domicile.GetHerd|0]"
											max_width = 50
											default_format = "#color_yellow"
											using = Font_Size_Medium
										}

										container = {
											text_single = {
												name = "army_from_herd"
												text = "[InGameTopbar.AccessHerdChangeBreakdown.GetValue|=1]"
												max_width = 50
												default_format = "#low"
											}
										}
									}
								}
								expand = {}
								divider_light = {
									layoutpolicy_vertical = expanding
									alpha = 0.8
								}
							}
							expand = {}
						}
					}
				}

				hbox = {
					name = "military"
					datacontext = "[GetPlayer]"

					widget = {
						button = {
							size = { 112 45 }
							onclick = "[ToggleGameViewData('military', GetPlayer.GetID)]"

							tooltip = "[InGameTopbar.GetMilitaryTooltip]"
							using = tooltip_ne
						}

						size = { 112 70 }

						background = {
							texture = "gfx/interface/skinned/resource_panel_piece_light.dds"
						}

						vbox = {
							margin_top = 4

							hbox = {
								layoutpolicy_horizontal = expanding
								expand = {}

								hbox = {
									spacing = 5
									icon = {
										name = "icon_soldier"
										texture = "gfx/interface/icons/icon_soldier.dds"
										size = { 25 25 }
									}

									flowcontainer = {
										direction = vertical
										datacontext = "[GetPlayerArmyComposition]"

										flowcontainer = {
											spacing = 2

											text_single = {
												name = "strength"
												text = "[InGameTopbar.GetCurrentTroopsCount]"
												default_format = "#high"
												align = nobaseline
											}

											army_quality_icon = {}
										}

										progressbar_standard = {
											name = "soldiers_max"
											size = { 40 8 }
											visible = "[NotEqualTo_int32(ArmyComposition.GetMaxNumberOfSoldiers, '(int32)0')]"

											min = 0
											max = "[IntToFloat(ArmyComposition.GetMaxNumberOfSoldiers)]"
											value = "[IntToFloat(ArmyComposition.GetCurrentNumberOfSoldiers)]"
										}
									}
								}

								expand = {}
							}

							expand = {}
						}
					}

					widget = {
						name = "domain_limit"
						visible = "[Not( IsLandlessAdventurer( GetPlayer ) )]"

						layoutpolicy_vertical = expanding

						button = {
							size = { 112 45 }
							onclick = "[ToggleGameView('my_realm')]"

							tooltip = "[Character.GetDomainLimitTooltip]"
							using = tooltip_ne
						}

						size = { 112 70 }

						background = {
							texture = "gfx/interface/skinned/resource_panel_end.dds"
						}

						vbox = {
							margin_top = 4

							hbox = {
								margin_bottom = 16

								expand = {}
								hbox = {
									margin = { 5 5 }
									spacing = 5

									background = {
										visible = "[GreaterThan_int32( Character.GetDomainSize, Character.GetDomainLimit )]"
										using = Status_Bad
										margin_bottom = -3
									}

									icon = {
										texture = "gfx/interface/icons/icon_domain.dds"
										size = { 25 25 }
									}

									text_single = {
										name = "value"
										text = "[Character.GetDomainSize]/[Character.GetDomainLimit]"
										align = nobaseline
										margin_bottom = 1
										max_width = 110
									}
								}
								expand = {}
							}
							expand = {}
						}
					}
				}
			}
		}
	}

	type container_royal_court_tooltip = container
	{
		using = GeneralTooltipSetup
		alwaystransparent = no

		object_tooltip_pop_out = {
			blockoverride "title_text"
			{
				margin = { 0 8 }
				text = "ROYAL_COURT"
				default_format = "#T"
			}

			blockoverride "concept_link"
			{
				visible = no
			}

			blockoverride "main_description"
			{
				vbox = {
					layoutpolicy_horizontal = expanding

					cooltip_paragraph = {
						visible = "[Not( Character.HasRoyalCourt )]"
						text = "[Character.GetRoyalCourtBlockers]"
					}

					cooltip_paragraph = {
						visible = "[GreaterThan_int32( Character.GetNumPendingCourtEvents, '(int32)0' )]"
						text = "ROYAL_COURT_STATUS_PENDING_EVENTS_BULLET"
					}
					cooltip_paragraph = {
						visible = "[GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfCategory( 'court' ), '(int32)0' )]"
						text = "ROYAL_COURT_STATUS_NEW_COURT_ARTIFACTS_BULLET"
					}
					cooltip_paragraph = {
						visible = "[And(LessThan_int32( CourtGrandeurData.GetCurrentLevel, CourtGrandeurData.GetMinimumExpectedLevel ),HasDlcFeature( 'royal_court' ))]"
						text = "ROYAL_COURT_STATUS_CGV_EXPECTATIONS_BULLET"
					}
					cooltip_paragraph = {
						visible = "[GreaterThan_int32( LocalPlayerCourtEvents.GetNumberCourtEvents, '(int32)0' )]"
						text = "ROYAL_COURT_STATUS_CURRENT_EVENTS_BULLET"
					}
				}
			}
		}
	}

	type activity_hud_button = button_normal
	{
		size = { 58 58 }

		tooltip = "TT_ACTIVITY_WIDGET"
		using = tooltip_above
		onclick = "[Activity.OpenActivityView]"

		icon_round_button_base = {}

		icon = {
			name = "progress_frame"
			texture = "gfx/interface/progressbars/action_progress_frame.dds"
			size = { 100% 100% }
			parentanchor = center
			alpha = 0.5
		}

		progresspie = {
			name = "progress"
			visible = "[Character.HasActivityState( 'travel' )]"
			size = { 50 50 }

			texture = "gfx/interface/progressbars/action_progress_thin.dds"

			framesize = { 128 128 }
			frame = 2

			widgetanchor = center
			parentanchor = center

			min = 0
			max = 1
			value = "[Character.GetTravelPlan.GetData.GetNextDestinationProgress]"
		}

		highlight_icon = {
			texture = "[Activity.GetType.GetIcon]"
			alwaystransparent = yes
			size = { 45 45 }
			parentanchor = center
		}
	}

	type icon_hud_background = icon {
		size = { 200 64 }
		texture = "gfx/interface/skinned/hud_bg_character_bar.dds"
		spritetype = corneredtiled
		spriteborder_left = 70
		spriteborder_right = 240
		texture_density = 2

		state = {
			name = _show
			using = Animation_Curve_Default
			duration = 0.21

			position = { 0 0 }
			alpha = 1
		}

		state = {
			name = _hide
			using = Animation_Curve_Default
			duration = 0.21

			position = { -36 50 }
			alpha = 0
		}
	}

	type tax_jurisdictions_button_tooltip = widget {
		alwaystransparent = no
		datacontext = "[GetPlayer]"

		vbox = {
			using = Background_Tooltip
			spacing = 10
			margin = { 20 10 }
			parentanchor = right|vcenter
			text_single = {
				text = "TAX_JURISDICTIONS_BUTTON"
				layoutpolicy_horizontal = expanding
			}

			hbox = {
				layoutpolicy_horizontal = expanding
				visible = "[Or( Or( GreaterThan_int32( Character.GetUnassignedVassalsCount, '(int32)0' ), Not( Character.HasTaxSlots ) ), GreaterThan_int32( Character.GetUntaxedJurisdictionCount, '(int32)0' ) )]"

				icon = {
					size = { 25 25 }
					texture = "gfx/interface/icons/symbols/icon_warning.dds"
				}

				vbox = {
					layoutpolicy_horizontal = expanding
					margin_left = 5

					text_single = {
						visible = "[GreaterThan_int32( Character.GetUntaxedJurisdictionCount, '(int32)0' )]"
						layoutpolicy_horizontal = expanding
						text = "TAX_SLOT_OVERVIEW_WINDOW_TAX_SLOTS_WARNING"
						default_format = "#N"
						max_width = 320
					}

					text_single = {
						visible = "[GreaterThan_int32( Character.GetUnassignedVassalsCount, '(int32)0' )]"
						layoutpolicy_horizontal = expanding
						text = "TAX_SLOT_OVERVIEW_WINDOW_UNASSIGNED_VASSALS_WARNING"
						default_format = "#N"
						max_width = 320
					}

					text_single = {
						visible = "[Not( Character.HasTaxSlots )]"
						layoutpolicy_horizontal = expanding
						text = "NO_TAX_SLOT_AVAILABLE"
						default_format = "#N"
						max_width = 320
					}
				}
			}
			expand = {}
		}
	}

	type administrative_button_tooltip = widget {
		alwaystransparent = no
		datacontext = "[GetPlayer]"

		vbox = {
			using = Background_Tooltip
			spacing = 10
			margin = { 20 10 }
			parentanchor = right|vcenter
			text_single = {
				text = "ADMINISTRATIVE_BUTTON"
				layoutpolicy_horizontal = expanding
			}
			expand = {}
		}
	}

	type epidemic_hud_tooltip_list = vbox
	{
		layoutpolicy_horizontal = expanding
		spacing = 10

		background = {
			using = Background_Area_With_Header
			margin = { 10 7 }
			using = Mask_Rough_Edges
		}

		cooltip_paragraph = {
			block "heading_text"
			{
				raw_text = "#D Fill me#!"
			}
			default_format = "#S"
		}

		vbox = {
			layoutpolicy_horizontal = expanding
			spacing = 10

			block "epidemic_datamodel"
			{
			}

			item = {
				hbox = {
					layoutpolicy_horizontal = expanding
					spacing = 10
					visible = "[Epidemic.IsValidCheck]"

					background = {
						using = Background_Area
						using = Mask_Rough_Edges
						using = Background_Alternate_Datamodel
						margin = { 10 7 }
					}

					icon_epidemic = {
						tooltipwidget = epidemic_tooltip
					}

					vbox = {
						layoutpolicy_horizontal = expanding

						cooltip_paragraph = {
							text = "[Epidemic.GetName]"
							default_format = "#S"
						}

						cooltip_paragraph = {
							text = "EPIDEMIC_TOTAL_DEATH_TOLL"
						}

						block "item_extra_data"
						{
						}
					}

					expand = {}
				}
			}
		}
	}

	type epidemic_hud_tooltip = object_tooltip_pop_out
	{
		blockoverride "title_text"
		{
			text = "EPIDEMICS_TITLE"
			default_format = "#T"
		}

		blockoverride "concept_link"
		{
			visible = no
		}

		blockoverride "main_description"
		{
			vbox = {
				layoutpolicy_horizontal = expanding
				spacing = 16

				epidemic_hud_tooltip_list = {
					name = "realm_epidemics"
					visible = "[DataModelHasItems( InGameBottomBar.GetEpidemicsInRealm )]"

					blockoverride "heading_text"
					{
						text = "HUD_EPIDEMICS_IN_REALM"
					}
					blockoverride "epidemic_datamodel"
					{
						datamodel = "[InGameBottomBar.GetEpidemicsInRealm]"
					}
					blockoverride "item_extra_data"
					{
						cooltip_paragraph = {
							text = "EPIDMIC_TOOLTIP_DOMAIN_INFECTIONS"
						}
					}
				}

				epidemic_hud_tooltip_list = {
					name = "nearby_epidemics"
					visible = "[DataModelHasItems( InGameBottomBar.GetEpidemicsBorderingRealm )]"

					blockoverride "heading_text"
					{
						text = "HUD_EPIDEMICS_BORDERING_REALM"
					}
					blockoverride "epidemic_datamodel"
					{
						datamodel = "[InGameBottomBar.GetEpidemicsBorderingRealm]"
					}
				}

				epidemic_hud_tooltip_list = {
					name = "global_epidemics"
					visible = "[DataModelHasItems( InGameBottomBar.GetGlobalNotificationEpidemics )]"

					blockoverride "heading_text"
					{
						text = "HUD_EPIDEMICS_GLOBAL_NOTIFICATIONS"
					}
					blockoverride "epidemic_datamodel"
					{
						datamodel = "[InGameBottomBar.GetGlobalNotificationEpidemics]"
					}
					blockoverride "item_extra_data"
					{
						cooltip_paragraph = {
							text = "HUD_EPIDEMIC_GLOBAL_NOTIFICATION"
							default_format = "#flavor"
						}
					}
				}
			}
		}
	}

	type button_epidemics = button
	{
		size = { 80 80 }
		using = tooltip_ne

		onclick = "[ToggleGameView( 'epidemics' )]"

		tooltipwidget = {
			epidemic_hud_tooltip = {}
		}

		video_icon = {
			name = "epidemic_particules"
			size = { 80 80 }

			visible = "[InGameBottomBar.HasGlobalNotificationEpidemic]"

			gfxtype = videogfx
			shaderfile = ""
			video = "gfx/particles/fly.bk2"
			loop = yes

			modify_texture = {
				texture = "gfx/interface/component_masks/mask_fade_horizontal_right.dds"
				blend_mode = alphamultiply
				spriteType = corneredTiled
				alpha = 0.8
			}
			modify_texture = {
				texture = "gfx/interface/component_masks/mask_fade_horizontal_right.dds"
				blend_mode = alphamultiply
				spriteType = corneredTiled
				mirror = horizontal
				alpha = 0.8
			}
		}

		button = {
			name = "epidemic_icon_global_notify"
			visible = "[InGameBottomBar.HasGlobalNotificationEpidemic]"
			texture = "gfx/interface/hud/button_epidemics_black_plague.dds"
			size = { 100% 100% }
			alwaystransparent = yes
		}

		button = {
			name = "epidemic_icon"
			visible = "[Not( InGameBottomBar.HasGlobalNotificationEpidemic )]"
			texture = "gfx/interface/hud/button_epidemics.dds"
			size = { 100% 100% }
			alwaystransparent = yes
		}
	}

	type legends_hud_tooltip = object_tooltip_pop_out
	{
		blockoverride "title_text"
		{
			text = "LEGENDS_TITLE"
			default_format = "#T"
			margin = { 0 5 }
		}

		blockoverride "concept_link"
		{
			visible = no
		}

		blockoverride "main_description"
		{
			vbox = {
				layoutpolicy_horizontal = expanding
				spacing = 15

				datacontext = "[GetPlayer]"
				datacontext = "[Character.GetPromotedLegend]"
				datacontext = "[AccessLocalPlayerCachedData]"

				vbox = {
					name = "promoted_legend"
					layoutpolicy_horizontal = expanding
					spacing = 15

					visible = "[And( Legend.IsValid, Not( Legend.IsCompleted ) )]"

					background = {
						using = Background_Area_With_Header
						margin = { 10 7 }
						using = Mask_Rough_Edges
					}

					cooltip_paragraph = {
						datacontext = "[Character.GetPromotedLegend]"

						text = "PROMOTED_LEGEND"
						default_format = "#S"
					}

					hbox = {
						layoutpolicy_horizontal = expanding
						spacing = 10

						background = {
							using = Background_Area
							using = Mask_Rough_Edges
							using = Background_Alternate_Datamodel
							margin = { 10 7 }
						}

						icon_legend = {
							datacontext = "[Legend.GetType]"
							tooltipwidget = legend_tooltip
						}

						vbox = {
							layoutpolicy_horizontal = expanding

							cooltip_paragraph = {
								text = "[Legend.GetName]"
								default_format = "#S"
							}

							legend_summary_vbox = {}
						}

						expand = {}
					}
				}

				vbox = {
					name = "legend_seeds"
					layoutpolicy_horizontal = expanding

					cooltip_paragraph = {
						text = "LEGEND_SEEDS"
						default_format = "#S"
					}

					cooltip_paragraph = {
						text = "HUD_LEGEND_SEEDS"
						visible = "[Or( DataModelHasItems( Character.GetLegendSeeds ), DataModelHasItems( LocalPlayerCachedData.GetTriggeredLegendSeeds ) )]"
					}

					cooltip_paragraph = {
						text = "LEGEND_SEEDS_EMPTY"
						visible = "[And( IsDataModelEmpty( Character.GetLegendSeeds ), IsDataModelEmpty( LocalPlayerCachedData.GetTriggeredLegendSeeds ) )]"
					}
				}
			}
		}
	}

	type icon_power_sharing_level = highlight_icon {
		size = { 28 28 }

		texture = "gfx/interface/window_regency/regency_level_button_badge.dds"

		text_single = {
			align = nobaseline
			parentanchor = center
			raw_text = "[Diarchy.GetPowerLevel]"
		}
	}


	type legitimacy_hud_tooltip = object_tooltip_pop_out
	{
		visible = "[And(LegitimacyType.IsValid, Character.GetGovernment.HasRule( 'legitimacy' ))]"

		blockoverride "title_text"
		{
			margin = { 0 8 }
			text = "legitimacy_hud_tt"
			default_format = "#T"
		}

		blockoverride "concept_link"
		{
			text = "[legitimacy|E]"
		}

		blockoverride "subheading"
		{
			text_single = {
				layoutpolicy_horizontal = expanding
				autoresize = yes
				fontsize_min = 14
				using = Font_Size_Small
				text = "legitimacy_hud_tt_subheading"
				default_format = "#weak"
				fonttintcolor = "[TooltipInfo.GetTintColor]"
				max_width = 400

				margin_top = -4
			}
		}

		blockoverride "header_additions"
		{
			widget = {
				size = { 120 74 }

				widget = {
					size = { 240 74 }
					position = { -16 0 }
					visible = "[Not( IsNomad( GetPlayer ) )]"

					proportional_icon = {
						size = { 100% 100% }
						visible = "[GreaterThanOrEqualTo_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
						texture = "gfx/interface/window_legend_chronicle/expected_legitimacy_decoration.dds"

						using = Mask_Rough_Edges

						modify_texture = {
							texture = "gfx/interface/component_masks/mask_fade_horizontal_right.dds"
							blend_mode = alphaMultiply
						}
					}

					proportional_icon = {
						size = { 100% 100% }
						visible = "[LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
						texture = "gfx/interface/window_legend_chronicle/under_expected_legitimacy_decoration.dds"

						using = Mask_Rough_Edges

						modify_texture = {
							texture = "gfx/interface/component_masks/mask_fade_horizontal_right.dds"
							blend_mode = alphaMultiply
						}
					}
				}

				widget = {
					size = { 240 74 }
					position = { -16 0 }
					visible = "[IsNomad( GetPlayer )]"

					proportional_icon = {
						size = { 100% 100% }
						visible = "[GreaterThanOrEqualTo_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
						texture = "gfx/interface/illustrations/decisions/mpo_decision_great_khan.dds"
						mirror = horizontal

						using = Mask_Rough_Edges

						modify_texture = {
							texture = "gfx/interface/component_masks/mask_fade_horizontal.dds"
							blend_mode = alphaMultiply
						}
					}

					proportional_icon = {
						size = { 100% 100% }
						visible = "[LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
						texture = "gfx/interface/illustrations/event_scenes/mpo_raid_burning_asian.dds"
						mirror = horizontal

						using = Mask_Rough_Edges

						modify_texture = {
							texture = "gfx/interface/component_masks/mask_fade_horizontal.dds"
							blend_mode = alphaMultiply
						}
					}
				}
			}
		}


		blockoverride "main_description"
		{
			vbox = {
				layoutpolicy_horizontal = expanding
				margin_right = 10

				hbox = {
					layoutpolicy_horizontal = expanding

					cooltip_paragraph = {
						text = "LEGITIMACY_EFFECTS"
						max_width = 500
					}
					expand = {
						layoutpolicy_horizontal = expanding
					}
				}
				spacer = {
					size = { 0 15 }
				}

				hbox = {
					name = "track_header"
					layoutpolicy_horizontal = expanding
					spacing = 5
					margin_left = -10
					min_height = 45

					background = {
						using = Background_Area
						margin = { -5 -5 }

						modify_texture = {
							texture = "gfx/interface/component_masks/mask_fade_horizontal_right.dds"
							blend_mode = alphaMultiply
						}
					}

					icon_legitimacy_flat = {}

					text_single = {
						text = "LEGITIMACY_TRACK_TITLE"
						layoutpolicy_horizontal = expanding
						align = nobaseline
					}
				}

				margin_widget = {
					size = { 500 50 }
					margin = { 10 0 }

					datacontext = "[Character.GetLegitimacyType]"
					datacontext = "[Character.GetLegitimacyLevel]"

					hbox_complex_bar_progress = {
						layoutpolicy_horizontal = expanding
						margin_top = 30
					}

					hbox_complex_bar_levels = {
						layoutpolicy_horizontal = expanding
						position = { 0 -10 }
						blockoverride "marker"
						{
							widget_level_marker = {
								scale = 0.75


								# Hide last one, it is the maximum not an actual level
								visible = "[LessThan_int32( PdxGuiWidget.GetIndexInDataModel, GetDataModelSize( LegitimacyType.GetLevels ) )]"

								blockoverride "marker_addon" {
									icon = {
										texture = "gfx/interface/colors/white.dds"
										using = Mask_Rough_Edges
										position = { -4 28 }
										size = { 8 40 }
										alpha = 0.4

										visible = "[GreaterThan_int32( PdxGuiWidget.GetIndexInDataModel, '(int32)0' )]"
									}

									widget = {
										size = { 52 52 }
										position = { -26 24 }
										visible = "[EqualTo_int32( Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex, PdxGuiWidget.GetIndexInDataModel )]"

										icon = {
											size = { 100% 100% }
											visible = "[Not(LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex ))]"
											texture = "gfx/interface/window_legend_chronicle/pin_expected_legitimacy.dds"
										}

										icon = {
											size = { 100% 100% }
											visible = "[LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
											texture = "gfx/interface/window_legend_chronicle/pin_under_expected_legitimacy.dds"
										}

										widget = {
											parentanchor = center
											size = { 28 28 }

											icon_flat_standard_red = {
												size = { 100% 100% }
												visible = "[LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
												texture = "[LegitimacyType.GetFlatIcon]"
											}

											icon_flat_standard = {
												size = { 100% 100% }
												visible = "[Not(LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex ))]"
												texture = "[LegitimacyType.GetFlatIcon]"
											}
										}
									}
								}

								blockoverride "visible_active"
								{
									visible = "[EqualTo_int32( LegitimacyLevel.GetIndex, PdxGuiWidget.GetIndexInDataModel )]"
								}

								blockoverride "visible_inactive"
								{
									visible = "[NotEqualTo_int32( LegitimacyLevel.GetIndex, PdxGuiWidget.GetIndexInDataModel )]"
								}

								blockoverride "marker_tooltip"
								{
									datacontext_from_model = {
										datamodel = "[LegitimacyType.GetLevels]"
										index = "[PdxGuiWidget.GetIndexInDataModel]"
									}
									tooltip = "LEGITIMACY_TRACK_TOOLTIP"
									using = tooltip_se
								}

								blockoverride "marker_text"
								{
									text = "[PdxGuiWidget.GetIndexInDataModel|V]"
								}
							}
						}
					}
				}

				spacer = {
					size = { 0 15 }
				}
				hbox = {
					layoutpolicy_horizontal = expanding

					vbox = {
						visible = "[Character.HasVassals]"
						spacing = 10
						layoutpolicy_horizontal = expanding

						cooltip_paragraph = {
							text = "LEGITIMACY_AVERAGE_EXPECTATIONS"
						}

						cooltip_paragraph = {
							visible = "[LessThan_int32( LegitimacyLevel.GetIndex, Character.GetAveragePowerfulVassalLegitimacyExpectation.GetIndex )]"
							text = "LEGITIMACY_BELOW_AVERAGE_EXPECTATIONS"
						}
					}
					expand = {
						layoutpolicy_horizontal = expanding
					}
				}
			}
		}
	}

	type herd_breakdown_hud_toolip = container
	{
		using = GeneralTooltipSetup
		alwaystransparent = no

		object_tooltip_pop_out = {
			blockoverride "title_text"
			{
				margin = { 0 8 }
				text = "DOMICILE_HERD_TITLE"
				default_format = "#T"

				block "herd_limit_breakdown"
				{
					datacontext = "[InGameTopbar.AccessHerdLimitBreakdown( Domicile.Self )]"
				}
				tooltipwidget = {
					widget_value_breakdown_tooltip = {}
				}
			}

			blockoverride "concept_link"
			{
				visible = no
			}

			blockoverride "main_description"
			{
				vbox = {
					layoutpolicy_horizontal = expanding

					cooltip_paragraph = {
						visible = "[Domicile.IsAboveHerdLimit]"
						text = "[Domicile.GetAboveHerdLimitEffects]"
					}

					spacer = {
						visible = "[Domicile.IsAboveHerdLimit]"
						size = { 0 15 }
					}

					cooltip_paragraph = {
						block "herd_change_breakdown"
						{
							datacontext = "[InGameTopbar.AccessHerdChangeBreakdown]"
						}

						text = "VALUE_BREAKDOWN_TEXT_LINK"

						tooltip_visible = "[ValueBreakdown.HasTooltip]"

						tooltipwidget = {
							widget_value_breakdown_tooltip = {}
						}
					}

					cooltip_paragraph = {
						block "herd_conversion_breakdown"
						{
							datacontext = "[InGameTopbar.AccessHerdConversionBreakdown( Domicile.Self )]"
						}

						text = "VALUE_BREAKDOWN_TEXT_LINK"

						tooltip_visible = "[ValueBreakdown.HasTooltip]"

						tooltipwidget = {
							widget_value_breakdown_tooltip = {}
						}
					}

					spacer = {
						size = { 0 15 }
					}

					cooltip_paragraph = {
						visible = "[Character.HasRaisedHorde]"
						text = "DOMICILE_HERD_ALREADY_RAISED"
					}

					cooltip_paragraph = {
						visible = "[Not( Character.HasRaisedHorde )]"
						text = "DOMICILE_HERD_HERD_TO_RAISE"
					}
				}
			}
		}
	}
}


types OCR {
	type button_task_contract_banner_ocr = button_text {

		blockoverride "text" {
			raw_text = "Active contract: [TaskContract.GetType.GetName]."
		}
		onclick = "[ToggleGameViewData('task_contract', TaskContract.Self )]"
	}

	type button_situation_banner_ocr = button_text {
		visible = "[Not( Situation.UsesMigration )]"
		onclick = "[ToggleGameViewData(Situation.GetWindowName, Situation.GetID)]"

		#onmousehierarchyenter = "[HighlightSituation( Situation.Self )]"
		#onmousehierarchyleave = "[ClearHighlightedSituationBorder]"
		tooltipwidget = situation_tooltip
		datacontext = "[Situation.GetTopCurrentPhase]"
		blockoverride "extra" {
			text_single = {
				raw_text = "[Situation.GetTopCurrentPhase.GetRelativeProgress|%0]"
			}
			text_single = {
				raw_text = "[Situation.GetType] situation,"
			}
			text_single = {
				raw_text = "[SituationPhase.GetName] phase,"
			}
		}
	}
}
