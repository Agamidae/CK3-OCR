### DYNASTY HOUSE WINDOW
window = {
	name = "dynasty_house_view"
	widgetid = "dynasty_house_view"
	datacontext = "[DynastyHouseView.GetDynastyHouse]"
	datacontext = "[DynastyHouse.GetDynasty]"
	movable = no
	allow_outside = yes
	layer = windows_layer
	using = base_ocr_window

	using = Window_Size_Sidebar
	using = Window_Background_Sidebar

	state = {
		name = _show
		using = Animation_FadeIn_Quick
		using = Sound_WindowShow_Standard

		on_start = "[GetVariableSystem.Set( 'hide_bottom_left_HUD', 'true' )]"
	}

	state = {
		name = _hide
		on_finish = "[Set('unity_tip', 'yes')]"
		on_finish = "[Clear('dynasty_view_expand')]"
		using = Animation_FadeOut_Quick
		using = Sound_WindowHide_Standard

		on_start = "[GetVariableSystem.Clear( 'hide_bottom_left_HUD' )]"
	}

	window_ocr = {
		layoutpolicy_horizontal = expanding
		blockoverride "ocr_header" {

			button = {
				using = close_window_ocr
				onclick = "[Clear('dynasty_view_expand')]"
				visible = "[Is('dynasty_view_expand')]"
			}

			button = {
				using = close_window_ocr
				visible = "[Isnt('dynasty_view_expand')]"
				onclick = "[DynastyHouseView.Close]"
				onclick = "[DynastyHouseView.CloseMembersWindow]"
			}

			hbox = {
				layoutpolicy_horizontal = expanding
				spacing = 3

				visible = "[Isnt('dynasty_view_expand')]"

				text_single = {
					raw_text = "HOUSE_VIEW_NAME_WITH_HOUSE"
				}

				comma = {}

				text_single = {
					visible = "[DynastyHouseView.HasHouseUnity]"
					raw_text = "[DynastyHouse.GetHouseUnityValue] unity."
				}
				text_single = {
					visible = [Dynasty.IsValid]
					raw_text = "[Dynasty.GetName] [dynasty|e]."
				}

				expand = {}
			}

			hbox = {
				layoutpolicy_horizontal = expanding
				spacing = 3
				visible = "[Has('dynasty_view_expand', 'unity_changelog')]"

				text_single = {
					raw_text = "[GetDataModelSize(DynastyHouseView.GetDynastyHouse.GetChangelog)]"
				}

				text_single = {
					raw_text = "HOUSE_UNITY_RECENT_CHANGES_LABEL"
				}

				dot_l = {}

				expand = {}
			}

			hbox = {
				layoutpolicy_horizontal = expanding
				visible = "[Has('dynasty_view_expand', 'unity_levels')]"

				text_single = {
					layoutpolicy_horizontal = expanding
					raw_text = "[Subtract_int32(GetDataModelSize(DynastyHouseView.GetHouseUnityStages), '(int32)1')] levels of unity:"
				}
				expand = {}
			}

			hbox = {
				layoutpolicy_horizontal = expanding
				visible = "[Has('dynasty_view_expand', 'houses')]"
				spacing = 3
				text_single = {
					raw_text = "[GetDataModelSize(DynastyHouseView.GetDynastyHouses)]"
				}
				text_single = {
					raw_text = "DYNASTY_VIEW_HOUSES"
				}
				dot_l = {}

				expand = {}
			}
		}

		blockoverride "ocr_content" {
			vbox = {
				name = "dynasty_house"
				widgetid = "dynasty_house"
				layoutpolicy_horizontal = expanding

				### HOUSE ###
				vbox = {
					visible = "[Isnt('dynasty_view_expand')]"
					layoutpolicy_horizontal = expanding
					button_text = {
						layoutpolicy_horizontal = expanding
						shortcut = map_mode_1
						onclick = "[Toggle('house_details')]"
						blockoverride "text" {
							raw_text = "House details, [Collapse('house_details')] E."
						}
					}

					vbox = {
						layoutpolicy_horizontal = expanding
						visible = "[Isnt('house_details')]"

						vbox = {
							layoutpolicy_horizontal = expanding
							layoutpolicy_vertical = expanding

							hbox = {
								layoutpolicy_horizontal = expanding
								spacing = 3

								text_single = {
									text = "HOUSE_VIEW_CONCEPT"
								}

								dot_l = {}

								text_single = {
									raw_text = "Motto:"
								}

								expand = {}
							}

							hbox = {
								layoutpolicy_horizontal = expanding

								text_multi_wide = {
									layoutpolicy_horizontal = expanding
									text = "HOUSE_VIEW_MOTTO"
								}
								expand = {}
							}

							vbox = {
								layoutpolicy_horizontal = expanding
								visible = "[DynastyHouse.IsNobleFamily]"

								powerful_family_bonus_ocr = {
									blockoverride "show_button" {
										visible = "[ObjectsEqual( DynastyHouse.GetHeadOfHouse, GetPlayer )]"
									}
									# enabled = "[ObjectsEqual( DynastyHouse.GetHeadOfHouse, GetPlayer )]"
									layoutpolicy_horizontal = expanding
								}

								vbox = {
									datacontext = "[DynastyHouse.GetHousePowerBonus]"
									layoutpolicy_horizontal = expanding

									text_single = {
										layoutpolicy_horizontal = expanding
										visible = "[DynastyHouse.IsDominant]"
										text = "ADMINISTRATIVE_GOVERNMENT_IS_DOMINANT_FAMILY"
									}

									text_single = {
										layoutpolicy_horizontal = expanding
										visible = "[And( DynastyHouse.IsPowerful, Not( DynastyHouse.IsDominant ) )]"
										text = "ADMINISTRATIVE_GOVERNMENT_IS_POWERFUL_FAMILY"
									}

									text_single = {
										layoutpolicy_horizontal = expanding
										visible = "[And( Not( DynastyHouse.IsPowerful ), Not( DynastyHouse.IsDominant ) )]"
										text = "HOUSE_VIEW_POWERLESS_FAMILY"
									}
								}
							}

							button_text = {
								layoutpolicy_horizontal = expanding
								visible = "[DynastyHouse.CanPlayerCustomize]"
								onclick = "[OpenHouseCustomizationWindow(DynastyHouse.Self)]"
								blockoverride "text" {
									raw_text = "Rename house."
								}
							}

							button_text = {
								layoutpolicy_horizontal = expanding
								shortcut = find_title_shortcut
								onclick = "[DynastyHouseView.ToggleMembersWindow('house')]"
								blockoverride "text" {
									text = "HOUSE_VIEW_MEMBERS"
								}
								blockoverride "extra" {
									comma = {}
									text_single = {
										raw_text = "V."
									}
								}
							}

							button_text = {
								datacontext = "[DynastyHouse.GetHeadOfHouse]"
								visible = "[Character.HasDomicile]"
								datacontext = "[Character.GetDomicile]"
								shortcut = map_mode_5
								layoutpolicy_horizontal = expanding

								onclick = "[ToggleGameViewData( 'domicile', Domicile.Self )]"
								blockoverride "text" {
									raw_text = "[Character.GetFirstNamePossessiveOrMy] [Domicile.GetType.GetNameNoTooltip] is in [Domicile.GetLocation.GetNameNoTooltip],"
								}
								blockoverride "extra" {
									text_single = {
										raw_text = "Control Q."
									}
								}
							}

							vbox = {
								visible = "[DataModelHasItems( DynastyHouseView.GetHouseModifiers )]"
								layoutpolicy_horizontal = expanding

								button_text = {
									layoutpolicy_horizontal = expanding
									shortcut = map_mode_11
									onclick = "[Toggle('house_modifiers')]"
									blockoverride "pre" {
										text_single = {
											raw_text = "[GetDataModelSize(DynastyHouseView.GetHouseModifiers)]"
										}
									}
									blockoverride "text" {
										text = "HOUSE_MODIFIERS"
									}
									blockoverride "extra" {
										text_single = {
											raw_text = "[Collapse('house_modifiers')] Shift E."
										}
									}
								}

								vbox = {
									datamodel = "[DynastyHouseView.GetHouseModifiers]"
									layoutpolicy_horizontal = expanding
									visible = "[Isnt('house_modifiers')]"

									item = {
										modifier_item_ocr = {
											layoutpolicy_horizontal = expanding
										}
									}
								}

								expand = {}
							}

							hbox = {
								layoutpolicy_horizontal = expanding

								text_multi_wide = {
									layoutpolicy_horizontal = expanding
									text = "HOUSE_VIEW_FOUNDED"

								}
								expand = {}
							}
						}

						### INVALID ###
						vbox = {
							layoutpolicy_horizontal = expanding
							datacontext = "[DynastyHouse.GetFounder]"
							visible = "[Not( DynastyHouse.GetHeadOfHouse.IsValid )]"

							datacontext = "[GetIllustration( 'character_view_bg' )]"

							state = {
								name = "house_view_refresh"
								using = Animation_Refresh_FadeOut
							}

							state = {
								using = Animation_Refresh_FadeIn
							}

							text_single = {
								layoutpolicy_horizontal = expanding
								text = "DYNASTY_TT_DEAD_HOUSE"
							}

							expand = {}
						}

						#### VALID ####
						vbox = {
							layoutpolicy_horizontal = expanding
							datacontext = "[DynastyHouse.GetHeadOfHouse]"
							datacontext = "[GetIllustration( 'character_view_bg' )]"
							visible = "[DynastyHouse.GetHeadOfHouse.IsValid]"

							state = {
								name = "house_view_refresh"
								using = Animation_Refresh_FadeOut
							}

							state = {
								using = Animation_Refresh_FadeIn
							}

							vbox = {
								layoutpolicy_horizontal = expanding

								vbox = {
									layoutpolicy_horizontal = expanding

									char_name = {
										blockoverride "pre" {
											text_single = {
												raw_text = "[house_head|E]:"
											}
										}
										layoutpolicy_horizontal = expanding
									}

									text_single = {
										layoutpolicy_horizontal = expanding
										visible = "[Not(Character.IsLocalPlayer)]"
										text = "[Character.GetRelationToString( GetPlayer )]"
										tooltip = "EXTENDED_RELATIONS_TOOLTIP"
									}
								}

								text_single = {
									layoutpolicy_horizontal = expanding
									text = "HOUSE_VIEW_MAX_MILITARY_STRENGTH"
								}
								### Dynasty Head
								vbox = {
									layoutpolicy_horizontal = expanding
									visible = "[Character.IsDynast]"

									hbox = {
										layoutpolicy_horizontal = expanding

										text_multi_wide = {
											visible = "[NotEqualTo_int32(Character.GetDynasty.GetFoundedDynastyHousesCount, '(int32)1')]"
											text = "DYNASTY_VIEW_BECOME_DYNAST"
										}

										expand = {}
									}

									hbox = {
										layoutpolicy_horizontal = expanding

										text_multi_wide = {
											visible = "[EqualTo_int32(Character.GetDynasty.GetFoundedDynastyHousesCount, '(int32)1')]"
											text = "DYNASTY_VIEW_BECOME_DYNAST_ONE_HOUSE"
										}
										expand = {}
									}
								}

								hbox = {
									layoutpolicy_horizontal = expanding
									char_name = {
										visible = "[DynastyHouse.HasHeirOfHouse]"
										datacontext = "[DynastyHouse.GetHeirOfHouse]"
										blockoverride "pre" {
											text_single = {
												raw_text = "House head heir:"
											}
										}
									}
									expand = {}
								}
							}
						}
					}

					button_text = {
						layoutpolicy_horizontal = expanding
						shortcut = map_mode_4
						onclick = "[Toggle('house_unity')]"
						visible = "[DynastyHouseView.HasHouseUnity]"
						blockoverride "text" {
							raw_text = "House Unity, [Collapse('house_unity')] Y."
						}
					}

					vbox = {
						visible = "[And(Isnt('house_unity'), DynastyHouseView.HasHouseUnity)]"
						datacontext = "[DynastyHouseView.GetCurrentHouseUnityStage]"
						layoutpolicy_horizontal = expanding
						layoutpolicy_vertical = expanding

							vbox = {
							name = house_unity_panel_widget # Used for Reactive Advice
							layoutpolicy_horizontal = expanding
							layoutpolicy_vertical = expanding
							# House Unity score & Name

							vbox = {
								layoutpolicy_horizontal = expanding
								visible = "[DataModelHasItems( DynastyHouseView.GetHouseUnityModifiers )]"
								datamodel = "[DynastyHouseView.GetHouseUnityModifiers]"

								hbox = {
									layoutpolicy_horizontal = expanding
									spacing = 3

									text_single = {
										raw_text = "[GetDataModelSize(DynastyHouseView.GetHouseUnityModifiers)]"
									}

									text_single = {
										text = "HOUSE_UNITY_MODIFIERS"
									}

									dot_l = {}

									expand = {}
								}


								item = {
									modifier_item_ocr = {
										layoutpolicy_horizontal = expanding
									}
								}
							}

							hbox = {
								layoutpolicy_horizontal = expanding
								spacing = 3

								text_single = {
									raw_text = "[HouseUnityStage.GetNameNoTooltip],"
								}


								text_single = {
									text = "HOUSE_UNITY_VALUE"

								}

								text_single = {
									raw_text = "[house_unity|E]."
								}

								expand = {}
							}

							vbox = {
								layoutpolicy_horizontal = expanding

								text_single = {
									layoutpolicy_horizontal = expanding
									visible = "[Not(DataModelHasItems( DynastyHouseView.GetDynastyHouse.GetChangelog ))]"
									raw_text = "HOUSE_UNITY_NO_RECENT_CHANGE_LABEL"
								}
							}

							button_text = {
								layoutpolicy_horizontal = expanding
								shortcut = character_finder
								onclick = "[SetOrToggle('dynasty_view_expand', 'unity_changelog')]"
								visible = "[DataModelHasItems( DynastyHouseView.GetDynastyHouse.GetChangelog )]"
								blockoverride "pre" {
									text_single = {
										raw_text = "[GetDataModelSize(DynastyHouseView.GetDynastyHouse.GetChangelog)]"
									}
								}
								blockoverride "text" {
									raw_text = "HOUSE_UNITY_RECENT_CHANGES_LABEL"
								}
								blockoverride "extra" {
									comma = {}
									text_single = {
										raw_text = "C."
									}
								}
							}

							text_single = {
								visible = "[Isnt('unity_tip')]"
								layoutpolicy_horizontal = expanding
								text = "HOUSE_UNITY_ACTIONS_INSTRUCTIONS"
							}

							### HOUSE UNITY DECISIONS ###
							vbox = {
								visible = "[DataModelHasItems(DynastyHouseView.GetDecisions(DynastyHouseView.GetCurrentHouseUnityStage))]"
								layoutpolicy_horizontal = expanding

								hbox = {
									layoutpolicy_horizontal = expanding
									spacing = 3

									text_single = {
										raw_text = "[CountItems]"

										hbox = {
											name = "items"
											datamodel = "[DynastyHouseView.GetDecisions(DynastyHouseView.GetCurrentHouseUnityStage)]"

											item = {
												hbox = {
													visible = "[Decision.IsValid]"
												}
											}
										}
									}

									text_single = {
										text = "HOUSE_UNITY_DECISIONS_TITLE"
									}

									dot_l = {}

									expand = {}
								}


								vbox = {
									name = house_unity_decisions # Used for Reactive Advice
									datamodel = "[DynastyHouseView.GetDecisions(DynastyHouseView.GetCurrentHouseUnityStage)]"
									layoutpolicy_horizontal = expanding
									item = {
										button_decision_entry_text = {
											blockoverride "num" {
											}
											shortcuts_list = {
												blockoverride "click" {
													onclick = "[DynastyHouseView.OnDecisionClick(Decision.Self)]"
												}
											}
											visible = "[Decision.IsValid]"
											datacontext = "[DynastyHouseView.GetCurrentHouseUnityStage]"
											onclick = "[DynastyHouseView.OnDecisionClick(Decision.Self)]"
											layoutpolicy_horizontal = expanding
										}
									}
								}
							}

							### DECISIONS AND EFFECTS ###
							vbox = {
								layoutpolicy_horizontal = expanding

								vbox = {
									name = house_unity_effects # Used for Reactive Advice
									datacontext = "[DynastyHouseView.GetCurrentHouseUnityStage]"
									layoutpolicy_horizontal = expanding
									### HOUSE UNITY EFFECTS ###

									text_single = {
										layoutpolicy_horizontal = expanding
										text = "HOUSE_UNITY_EFFECTS_TITLE"
									}

									text_multi_wide = {
										layoutpolicy_horizontal = expanding
										text = "[HouseUnityStage.GetModifierDesc]"
									}
								}
							}

							button_text = {
								shortcut = army_split_half
								onclick = "[SetOrToggle('dynasty_view_expand', 'unity_levels')]"
								layoutpolicy_horizontal = expanding
								blockoverride "text" {
									raw_text = "View all levels of unity, F."
								}
							}

							text_single = {
								layoutpolicy_horizontal = expanding
								visible = "[And( DynastyHouseView.IsPlayersHouse(), Not(DynastyHouseView.IsPlayerEffectedByHouseUnity()) )]"
								text = "HOUSE_UNITY_EFFECTS_NOT_APPLIED_TO_YOU"
							}

							# House Unity status bar
							# widget = {
							# 	widget_house_unity_status_bar = {}
							# }
						}


						expand = {}
					}

					### DYNASTY
					vbox = {
						layoutpolicy_horizontal = expanding
						layoutpolicy_vertical = expanding

						vbox = {
							layoutpolicy_horizontal = expanding
							layoutpolicy_vertical = expanding

							hbox = {
								layoutpolicy_horizontal = expanding

								text_multi_wide = {
									text = "HOUSE_VIEW_PART_OF_DYNASTY"
								}

								expand = {}
							}

							button_text = {
								layoutpolicy_horizontal = expanding
								visible = "[Dynasty.CanPlayerCustomize]"
								onclick = "[OpenDynastyCustomizationWindow(Dynasty.Self)]"
								blockoverride "text" {
									raw_text = "Rename dynasty."
								}
							}

							text_single = {
								layoutpolicy_horizontal = expanding
								text = "DYNASTY_VIEW_CONCEPT"
							}

							text_single = {
								visible = "[Dynasty.GetDynast.IsValid]"
								layoutpolicy_horizontal = expanding
								text = "DYNASTY_TT_DYNAST"
							}

							text_single = {
								visible = "[Not( Dynasty.GetDynast.IsValid )]"
								layoutpolicy_horizontal = expanding
								text = "DYNASTY_TT_DEAD_DYNASTY"
							}

							vbox = {
								layoutpolicy_horizontal = expanding
								layoutpolicy_vertical = expanding

								button_text = {
									layoutpolicy_horizontal = expanding
									onclick = "[DynastyHouseView.ToggleMembersWindow('dynasty')]"
									tooltip = "DYNASTY_VIEW_MEMBERS_TT"
									blockoverride "text"
									{
										text = "DYNASTY_VIEW_MEMBERS"
									}
								}

								vbox = {
									visible = "[GreaterThan_int32( GetDataModelSize( Dynasty.GetDynastyHouses ), '(int32)1' )]"
									layoutpolicy_horizontal = expanding
									button_text = {
										layoutpolicy_horizontal = expanding
										shortcut = army_create_new
										onclick = "[GetVariableSystem.SetOrToggle( 'dynasty_view_expand', 'houses' )]"
										tooltip = "DYNASTY_VIEW_HOUSES_TT"

										blockoverride "text"
										{
											text = "DYNASTY_VIEW_HOUSES_AMOUNT"
										}

										blockoverride "extra" {
											comma = {}
											text_single = {
												raw_text = "H."
											}
										}
									}
								}
							}

							button_primary_text = {
								layoutpolicy_horizontal = expanding
								blockoverride "text" {
									raw_text = "HOUSE_VIEW_SHOW_LEGACIES"
								}
								datacontext = "[DynastyHouseView.GetTopLegacy]"

								onclick = "[OpenGameViewData( 'dynasty_legacy_window', Dynasty.GetID )]"
							}
							### MODIFIERS ###
							vbox = {
								visible = "[DataModelHasItems( DynastyHouseView.GetDynastyModifiers )]"
								layoutpolicy_horizontal = expanding

								button_text = {
									layoutpolicy_horizontal = expanding
									shortcut = map_mode_11
									onclick = "[Toggle('dynasty_modifiers')]"
									blockoverride "pre" {
										text_single = {
											raw_text = "[GetDataModelSize(DynastyHouseView.GetDynastyModifiers)]"
										}
									}
									blockoverride "text" {
										text = "DYNASTY_MODIFIERS"
									}
									blockoverride "extra" {
										text_single = {
											raw_text = "[Collapse('dynasty_modifiers')] Shift E."
										}
									}
								}

								vbox = {
									visible = "[Isnt('dynasty_modifiers')]"
									name = "dynasty modifiers"
									datamodel = "[DynastyHouseView.GetDynastyModifiers]"
									layoutpolicy_horizontal = expanding

									item = {
										modifier_item_ocr = {
											layoutpolicy_horizontal = expanding
										}
									}
								}
								expand = {}
							}


							button_text = {
								layoutpolicy_horizontal = expanding
								onclick = "[Toggle('unlocked_legacies')]"
								blockoverride "extra" {

									text_single = {
										raw_text = "[CountItems]"
										hbox = {
											datamodel = "[DynastyHouseView.GetLegacies]"
											name = "items"
											item = {
												hbox = {
													visible = "[GreaterThan_int32(DynastyLegacyItem.GetUnlockedPerksCount, '(int32)0')]"
												}
											}
										}
									}

									text_single = {
										raw_text = "unlocked legacies, [Collapse('unlocked_legacies')]"
									}
								}
							}

							vbox = {
								layoutpolicy_horizontal = expanding
								datamodel = "[DynastyHouseView.GetLegacies]"
								visible = "[Isnt('unlocked_legacies')]"
								margin_left = 5

								item = {
									hbox = {
										layoutpolicy_horizontal = expanding
										spacing = 3
										visible = "[GreaterThan_int32(DynastyLegacyItem.GetUnlockedPerksCount, '(int32)0')]"

										text_single = {
											raw_text = "[DynastyLegacyItem.GetLegacy.GetName],"
										}

										text_single = {
											raw_text = "[DynastyLegacyItem.GetUnlockedPerksCount] perks."
										}

										expand = {}
									}
								}
							}


							expand = {}

							text_single = {
								layoutpolicy_horizontal = expanding
								raw_text = "Level of splendor: [Dynasty.GetPrestigeLevelName]. Next level: [Dynasty.GetNextPrestigeLevelName]."
							}
						}

						vbox = {
							layoutpolicy_horizontal = expanding

							text_single = {
								layoutpolicy_horizontal = expanding
								raw_text = "[Dynasty.GetPrestigeLevelProgressTooltip]."
							}

							### LEGACY ###
							vbox = {
								datacontext = "[DynastyHouse.GetDynasty]"
								datacontext = "[DynastyHouseView.GetTopLegacy]"
								layoutpolicy_horizontal = expanding

								flowcontainer = {
									ignoreinvisible = yes
									layoutpolicy_horizontal = expanding

									text_single = {
										raw_text = "DYNASTY_HOUSE_VIEW_PROGRESS_TOOLTIP"
									}
									dot = {}
								}

								vbox = {
									name = "tutorial_highlight_dynasty_perks_button"
									layoutpolicy_horizontal = expanding

								}


								expand = {
									layoutpolicy_vertical = expanding
								}
							}
						}
					}
				}

				vbox = {
					visible = "[Has('dynasty_view_expand', 'unity_levels')]"
					layoutpolicy_horizontal = expanding

					button_checked_text = {
						layoutpolicy_horizontal = expanding
						onclick = "[Toggle('unity_levels_desc')]"
						onclick = "[Clear('unity_levels_decisions')]"
						shortcut = map_mode_1
						blockoverride "text" {
							raw_text = "Show effects, E."
						}
						blockoverride "visible" {
							visible = "[Is('unity_levels_desc')]"
						}
					}

					button_checked_text = {
						layoutpolicy_horizontal = expanding
						onclick = "[Toggle('unity_levels_decisions')]"
						onclick = "[Set('unity_levels_desc', 'yes')]"
						shortcut = mapmode_house_secondary
						blockoverride "text" {
							raw_text = "Show decisions, Shift D."
						}
						blockoverride "visible" {
							visible = "[Isnt('unity_levels_decisions')]"
						}
					}

					datamodel = "[DataModelSkipLast(DynastyHouseView.GetHouseUnityStages, '(int32)1')]"

					item = {
						vbox = {
							layoutpolicy_horizontal = expanding

							hbox = {
								layoutpolicy_horizontal = expanding
								datacontext = "[GUIHouseUnityStage.GetHouseUnityStage]"
								tooltipwidget = {
									house_unity_stage_tooltip = {}
								}
								spacing = 3
								text_single = {
									visible = "[GUIHouseUnityStage.IsActive]"
									raw_text = "Active"
								}

								text_single = {
									raw_text = "Level [GUIHouseUnityStage.GetValue], [GUIHouseUnityStage.GetHouseUnityStage.GetName]."
								}
								expand = {}
							}
							hbox = {
								layoutpolicy_horizontal = expanding
								visible = "[Isnt('unity_levels_desc')]"

								text_multi_wide = {
									raw_text = "[GUIHouseUnityStage.GetModifierDesc]"
								}

								expand = {}
							}

							vbox = {
								layoutpolicy_horizontal = expanding
								visible = "[Is('unity_levels_decisions')]"
								datacontext = "[GUIHouseUnityStage.GetHouseUnityStage]"

								hbox = {
									layoutpolicy_horizontal = expanding
									spacing = 3
									visible = no

									text_single = {
										raw_text = "[CountItems]"

										hbox = {
											name = "items"
											datamodel = "[DynastyHouseView.GetDecisions(HouseUnityStage.Self)]"

											item = {
												hbox = {
													visible = "[Decision.IsValid]"
												}
											}
										}
									}

									text_single  = {
										text = "HOUSE_UNITY_DECISIONS_TITLE"
									}

									comma = {}

									expand = {}
								}

								vbox = {
									layoutpolicy_horizontal = expanding
									datamodel = "[DynastyHouseView.GetDecisions(HouseUnityStage.Self)]"

									item = {
										vbox = {
											layoutpolicy_horizontal = expanding
											visible = "[Decision.IsValid]"
											text_single = {
												raw_text = "[Decision.GetName],"
												layoutpolicy_horizontal = expanding
											}
										}
									}
								}
							}
						}
					}
				}

				vbox = {
					layoutpolicy_horizontal = expanding
					visible = "[Has('dynasty_view_expand', 'unity_changelog')]"

					datamodel = "[DynastyHouseView.GetDynastyHouse.GetChangelog]"

					item = {
						vbox = {
							layoutpolicy_horizontal = expanding

							hbox_house_unity_changelog_entry_ocr = {}
						}
					}
				}

				vbox = {
					# using = Window_Margins
					layoutpolicy_horizontal = expanding
					visible = "[Has('dynasty_view_expand', 'houses')]"
					datacontext = "[DynastyHouseView.GetDynastyHouse.GetDynasty]"

					hbox = {
						layoutpolicy_horizontal = expanding

						text_single = {
							raw_text = "Sort by:"

						}

						dropdown_menu_standard =
						{
							blockoverride "dropdown_properties"
							{
								datamodel = "[DynastyHouseView.GetOrderOptions]"
								onselectionchanged = "[DynastyHouseView.SortHouses]"
								selectedindex = "[DynastyHouseView.GetSortSelectedIndex]"
							}

							blockoverride "dropdown_active_item_properties"
							{
								raw_text = "[HouseOrderOption.GetName]."
							}

							blockoverride "dropdown_item_properties"
							{
								raw_text = "[HouseOrderOption.GetName]."
							}

						}

						expand = {}
					}

					scrollbox = {
						name = "houses"
						layoutpolicy_horizontal = expanding
						layoutpolicy_vertical = expanding

						blockoverride "scrollbox_content"
						{
							vbox = {
								layoutpolicy_horizontal = expanding
								datamodel = "[DynastyHouseView.GetDynastyHouses]"

								item = {
									button_standard_hover = {
										using = agot_show_house_view

										layoutpolicy_horizontal = expanding
										onclick = "[PdxGuiTriggerAllAnimations('house_view_refresh')]"
										onclick = "[DefaultOnHouseCoatOfArmsClick(DynastyHouse.GetID)]"

										vbox = {
											resizeparent = yes

											hbox = {
												layoutpolicy_horizontal = expanding

												vbox = {
													layoutpolicy_horizontal = expanding

													hbox = {
														layoutpolicy_horizontal = expanding

														text_single = {
															raw_text = "[DynastyHouse.GetBaseNameNoTooltip],"
														}
														text_single = {
															text = "HOUSE_LIST_MEMBERS"
														}

														dot = {}
														text_single = {
															visible = "[DynastyHouse.IsFoundingHouse]"
															text = "HOUSE_LIST_FOUNDING"
														}

														text_single = {
															using = agot_show_cadet_house
															text = "HOUSE_LIST_CADET"
														}

														text_agot_bastard_cadet = {}

														text_single = {
															raw_text = ","
														}
														text_single = {
															text = "HOUSE_LIST_FOUNDATION"
														}
														dot = {}
														expand = {}
													}

													flowcontainer = {
														visible = "[DynastyHouse.GetHeadOfHouse.IsValid]"
														layoutpolicy_horizontal = expanding

														text_single = {
															layoutpolicy_horizontal = expanding
															text = HOUSE_LIST_HEAD
														}

														dot = {}

														text_single = {
															text = "HOUSE_LIST_HEAD_MAX_MILITARY_STRENGTH"
															tooltip = "HOUSE_LIST_MILITARY_STRENGTH_TT"
														}

														text_single = {
															raw_text = " soldiers."
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	window_dynasty_house_view_old = {}
}

types OCR {
	type hbox_house_unity_changelog_entry_ocr = hbox {
		layoutpolicy_horizontal = expanding


		vbox = {
			layoutpolicy_horizontal = expanding

			text_single = {
				layoutpolicy_horizontal = expanding
				visible = "[HouseUnityChangelogEntry.GetNextHouseUnityStageType.IsValid]"
				text = "HOUSE_UNITY_STAGE_CHANGE_VALUE_TRIGGER_CHANGE_STAGE"
			}

			hbox = {
				layoutpolicy_horizontal = expanding
				spacing = 3

				text_single = {
					raw_text = "[HouseUnityChangelogEntry.GetProgress|+=],"
				}

				text_single = {
					block "change_value_text" {
						layoutpolicy_horizontal = expanding
						text = "HOUSE_UNITY_STAGE_CHANGE_VALUE_TRIGGER_CHARACTER"
					}
				}

				expand = {}
			}

			text_single = {
				layoutpolicy_horizontal = expanding
				text = "[HouseUnityChangelogEntry.GetDescription]"
			}
		}
	}
}


types DynastyView
{
	type widget_legacy_icon = widget {
		size = { 100% 100% }

		background = {
			texture = "gfx/interface/icons/lifestyle_tree_backgrounds/temptation.dds"
			tintcolor = { 0.2 0.2 0.2 1 }

			using = Mask_Rough_Edges
			alpha = 0.8
			fittype = centercrop
			mirror = horizontal

			modify_texture = {
				texture = "gfx/interface/component_masks/mask_fade_circle.dds"
				blend_mode = alphamultiply
			}
		}

		background = {
			texture = "gfx/interface/icons/lifestyle_tree_backgrounds/temptation.dds"
			tintcolor = { 1 0.9 1 0.15 }

			using = Mask_Rough_Edges
			fittype = centercrop
			mirror = horizontal
			margin_right = 10
			margin_top = 20

			modify_texture = {
				texture = "gfx/interface/component_masks/mask_fade_circle.dds"
				blend_mode = alphamultiply
			}
		}

		icon_flat_standard = {
			size = { 80 80 }
			parentanchor = top|hcenter
			visible = "[GreaterThan_int32(DynastyLegacyItem.GetUnlockedPerksCount, '(int32)0')]"
			texture = "[DynastyLegacyItem.GetLegacy.GetIcon]"
			alwaystransparent = yes
		}

		icon_flat_standard = {
			size = { 80 80 }
			parentanchor = top|hcenter
			visible = "[EqualTo_int32(DynastyLegacyItem.GetUnlockedPerksCount, '(int32)5')]"
			texture = "[DynastyLegacyItem.GetLegacy.GetIcon]"
			alwaystransparent = yes
		}

		icon_flat_standard = {
			visible = "[EqualTo_int32(DynastyLegacyItem.GetUnlockedPerksCount, '(int32)0')]"
			size = { 80 80 }
			parentanchor = top|hcenter
			texture = "[DynastyLegacyItem.GetLegacy.GetIcon]"
			alwaystransparent = yes
			blockoverride "master_color_frame" {
				frame = 6
			}
		}
	}

	type legacy_progress_none = icon {
		texture = "gfx/interface/progressbars/progress_scheme.dds"
		size = { 14 14 }
		framesize = { 45 45 }
	}

	type legacy_progress = icon {
		texture = "gfx/interface/progressbars/progress_scheme.dds"
		size = { 14 14 }
		framesize = { 45 45 }
		frame = 3
	}

	### UNITYBAR ###
	type house_unity_stage = icon {
		datacontext = "[GUIHouseUnityStage.GetHouseUnityStage]"

		layoutpolicy_horizontal = expanding

		block "size" {
			size = { 50 20 }
		}

		visible = "[And(HouseUnityStage.IsValid, Not(GUIHouseUnityStage.IsActive))]"
		texture = "[HouseUnityStage.GetProgressBar]"

		block "stage_icon" { }

		spriteborder = { 6 6 }
		spriteType = Corneredtiled

		tooltipwidget = {
			house_unity_stage_tooltip = {}
		}
	}

	type house_unity_stage_active = house_unity_stage {
		visible = "[And(HouseUnityStage.IsValid, GUIHouseUnityStage.IsActive)]"
		animation_attention_bar = {}

		### Horizontal Wipe Animation Left
		icon = {
			size = { 100% 90% }
			parentanchor = vcenter
			texture = "gfx/interface/colors/white.dds"
			alpha = 0

			modify_texture = {
				name = "horizontal_wipe"
				texture = "gfx/interface/progressbars/progressbar_center_glow_white_decrease.dds"
				blend_mode = alphamultiply
			}

			state = {
				name = a
				next = b
				trigger_on_create = yes
				duration = 0
				alpha = 0

				modify_texture = {
					name = "horizontal_wipe"
					translate_uv = { -0.5 0 }
				}
			}

			state = {
				name = b
				next = c
				duration = 1
				alpha = 1
				on_finish = "[PdxGuiTriggerAllAnimations('grandeur_bar_glow')]"

				modify_texture = {
					name = "horizontal_wipe"
					translate_uv = { 1 0 }
				}
			}

			state = {
				name = c
				next = a
				duration = 0.5
				alpha = 0
				delay = 1.5
			}
		}

		### Horizontal Wipe Animation Right
		icon = {
			size = { 100% 90% }
			parentanchor = vcenter
			texture = "gfx/interface/colors/white.dds"
			alpha = 0

			modify_texture = {
				name = "horizontal_wipe"
				texture = "gfx/interface/progressbars/progressbar_center_glow_white_increase.dds"
				blend_mode = alphamultiply
			}

			state = {
				name = a
				next = b
				trigger_on_create = yes
				duration = 0
				alpha = 0

				modify_texture = {
					name = "horizontal_wipe"
					translate_uv = { 0.5 0 }
				}
			}

			state = {
				name = b
				next = c
				duration = 1
				alpha = 1
				on_finish = "[PdxGuiTriggerAllAnimations('grandeur_bar_glow')]"

				modify_texture = {
					name = "horizontal_wipe"
					translate_uv = { -1 0 }
				}
			}

			state = {
				name = c
				next = a
				duration = 0.5
				alpha = 0
				delay = 1.5
			}
		}


		widget = {
			position = "[GUIHouseUnityStage.GetMarkerPosition(PdxGuiWidget.Self)]"

			icon = {
				block "marker_glow_attributes" {
					position = { -17 2 }
					size = { 25 28 }
				}
				texture = "gfx/interface/progressbars/progressbar_center_glow.dds"
				color = { 0.75 0.89 0.97 0.9 }
			}

			block "marker" {
				icon = {
					size = { 12 34 }
					position = { -5 -2 }
					texture = "gfx/interface/window_roco_grandeur/grandeur_bar_base_level.dds"
				}
			}
		}

		block "stage_icon" {}
	}

	type widget_house_unity_status_bar = widget {
		size = { 100% 100% }

		widget = {
			size = { 98% 20 }
			parentanchor = bottom|hcenter
			position = { 0 -64}

			background = {
				using = Background_Area_ExtraDark
			}
		}

		hbox = {
			layoutpolicy_horizontal = expanding
			layoutpolicy_vertical = expanding

			margin_left = 20
			margin_right = 20

			datamodel = "[DynastyHouseView.GetHouseUnityStages]"

			item = {
				hbox = {
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					layoutstretchfactor_horizontal = "[GUIHouseUnityStage.GetWeight]"

					widget = {
						icon = {
							size = { 30 40 }
							position = { -15 -10 }
							texture = "gfx/interface/window_dynasty_house/small_arrow.dds"
							alpha = 1

							text_single = {
								parentanchor = center
								position = { 0 -10 }
								text = "[GUIHouseUnityStage.GetValue]"
								align = center
							}
						}
					}

					house_unity_stage = {
						blockoverride "size" {
							size = { 50 25 }
						}

						blockoverride "stage_icon" {
							icon = {
								texture = "[HouseUnityStage.GetIcon]"
								size = { 50 50 }
								position = { 0 -35 }
								parentanchor = center

								modify_texture = {
									texture = "gfx/interface/colors/grey.dds"
									alpha = 0.3
									blend_mode = multiply
								}
							}
						}
					}

					house_unity_stage_active = {
						blockoverride "size" {
							size = { 50 40 }
						}

						blockoverride "marker_glow_attributes" {
							position = { -10 2 }
							size = { 14 35 }
						}

						blockoverride "marker" {
							icon = {
								size = { 45 45 }
								position = { -22 15 }
								texture = "gfx/interface/window_dynasty_house/unity_arrow.dds"
							}
						}

						blockoverride "stage_icon" {
							icon = {
								texture = "[HouseUnityStage.GetIcon]"
								position = { 0 -40 }
								size = { 70 70 }
								parentanchor = center
							}
						}
					}
				}
			}
		}
	}

	type house_unity_stage_tooltip = object_tooltip_pop_out {
		alwaystransparent = no

		blockoverride "header_additions"
		{
			hbox = {
				margin_right = 10
				margin_top = 8
				margin_left = -4

				icon = {
					size = { 52 52 }
					texture = "[HouseUnityStage.GetIcon]"
				}
			}
		}

		blockoverride "title_text" {
			margin = { 0 8 }
			text = "[HouseUnityStage.GetNameNoTooltip]"
			default_format = "#T"
		}

		blockoverride "main_description" {
			textbox = {
				name = "main_description"
				layoutpolicy_horizontal = expanding
				max_width = 400
				margin_top = 5
				margin_bottom = 15
				using = DefaultTooltipText
				multiline = yes
				text = "[HouseUnityStage.GetDescription]"
				fonttintcolor = "[TooltipInfo.GetTintColor]"
				alwaystransparent = no
			}

			text_multi = {
				visible = "[DynastyHouse.IsPlayerMember]"
				layoutpolicy_horizontal = expanding
				max_width = 400
				margin_top = 5
				margin_bottom = 15
				using = DefaultTooltipText
				multiline = yes
				text = "[HouseUnityStage.GetAffectHouseUnityDesc(GetPlayer)]"
				fonttintcolor = "[TooltipInfo.GetTintColor]"
				alwaystransparent = no
			}

			vbox = {
				layoutpolicy_horizontal = expanding
				spacing = 3
				margin_bottom = 10

				text_label_left  = {
					layoutpolicy_horizontal = expanding
					margin_left = 16
					text = "HOUSE_UNITY_EFFECTS_TITLE"
				}

				text_multi = {
					layoutpolicy_horizontal = expanding
					max_width = 400
					autoresize = yes
					text = "[HouseUnityStage.GetModifierDesc]"
				}
			}

			vbox = {
				layoutpolicy_horizontal = expanding
				block "decisions_visibility" {
					visible = "[DataModelHasItems( DynastyHouseView.GetDecisions(HouseUnityStage.Self) )]"
				}

				text_label_left  = {
					layoutpolicy_horizontal = expanding
					margin_left = 16
					text = "HOUSE_UNITY_DECISIONS_TITLE"
				}

				vbox = {
					layoutpolicy_horizontal = expanding
					block "decisions_datamodel" {
						datamodel = "[DynastyHouseView.GetDecisions(HouseUnityStage.Self)]"
					}
					margin_left = 6

					item = {
						hbox = {
							layoutpolicy_horizontal = expanding

							text_single = {
								visible = "[Decision.IsValid]"
								text = "[Decision.GetName]"
								align = nobaseline
								layoutpolicy_horizontal = expanding
							}
						}
					}
				}
			}
		}

		blockoverride "concept_link" {
			text = "[house_unity_level|E]"
		}
	}

	type button_unity_decision = button_standard {
		size = { 300 45 }

		block "decision_context" { }

		tooltipwidget = {
			decision_tooltip = {}
		}

		onclick = "[DynastyHouseView.OnDecisionClick(Decision.Self)]"

		widget = {
			datacontext = "[DynastyHouse.GetFounder]"
			scissor = yes
			parentanchor = right|top

			block "size_illustration" {
				size = { 250 43 }
			}

			icon = {
				name = "illustration"
				parentanchor = right|top
				size = { 250 100 }

				mirror = horizontal
				texture = "[Decision.GetPicture( Character.Self )]"
				alpha = 0.7

				visible = "[Decision.IsPossibleForPlayer]"

				using = Mask_Rough_Edges

				modify_texture = {
					texture = "gfx/interface/component_masks/mask_fade_horizontal_extended.dds"
					blend_mode = alphamultiply
				}
			}

			highlight_icon = {
				parentanchor = right|top
				size = { 250 100 }

				mirror = horizontal
				texture = "[Decision.GetPicture( Character.Self )]"
				alpha = 0.7

				visible = "[Not(Decision.IsPossibleForPlayer)]"

				effectname = "GreyedOut"

				tintcolor = { 0.6 0.6 0.6 0.7 }

				using = Mask_Rough_Edges

				modify_texture = {
					texture = "gfx/interface/component_masks/mask_fade_horizontal_extended.dds"
					blend_mode = alphamultiply
				}
			}
		}

		hbox = {
			margin = { 20 0 }
			margin_right = 10

			text_single = {
				layoutpolicy_horizontal = growing
				name = "title"
				text = "[Decision.GetTitleForPlayer]"
				visible = "[Decision.IsPossibleForPlayer]"
				default_format = "#clickable"
				align = nobaseline
			}

			text_single = {
				layoutpolicy_horizontal = growing
				name = "title2"
				text = "[Decision.GetTitleForPlayer]"
				visible = "[Not(Decision.IsPossibleForPlayer)]"
				block "default_format" {
					default_format = "#low"
				}
				align = nobaseline
			}

			highlight_icon = {
				size = { 30 30 }
				name = "not_possible"
				texture = "gfx/interface/icons/symbols/icon_cross.dds"
				visible = "[Not(Decision.IsPossibleForPlayer)]"
			}
		}
	}

	# "Look at me!" Animation for bar
	type animation_attention_bar = icon {
		name = "bar_effect"
		parentanchor = center
		size = { 100% 100% }

		spriteType = Corneredtiled
		spriteborder = { 10 10 }

		texture = "gfx/interface/component_effects/attention_text.dds"
		using = Color_White

		state = {
			trigger_on_create = yes
			name = a
			next = b

			using = Animation_Curve_Default
			duration = 0.8
			alpha = 1
		}

		state = {
			name = b
			next = a

			using = Animation_Curve_Default
			duration = 1.5
			alpha = 0.5
		}
	}

	type hbox_house_unity_changelog_entry = hbox {
		layoutpolicy_horizontal = expanding
		layoutpolicy_vertical = expanding

		spacing = 10

		widget = {
			size = { 56 30 }

			block "icon_progress" {
				icon = {
					size = { 100% 100% }
					background = {
						visible = "[GreaterThan_int32( HouseUnityChangelogEntry.GetProgress, '(int32)0' )]"
						using = Background_Frame
						using = Color_Green
						alpha = 0.3
						margin_left = 4
						margin_right = 16
						margin_top = 1
						margin_bottom = 3
					}

					background = {
						visible = "[LessThanOrEqualTo_int32( HouseUnityChangelogEntry.GetProgress, '(int32)0' )]"
						using = Background_Area_Dark
						using = Color_Green
						alpha = 0.1
						margin_left = 4
						margin_right = 16
						margin_top = 1
						margin_bottom = 3
					}

					background = {
						visible = "[GreaterThan_int32( HouseUnityChangelogEntry.GetProgress, '(int32)0' )]"
						using = Background_Frame
						using = Color_Grey
						alpha = 0.5
						margin_left = 4
						margin_right = 16
						margin_top = 1
						margin_bottom = 3
					}

					background = {
						visible = "[LessThanOrEqualTo_int32( HouseUnityChangelogEntry.GetProgress, '(int32)0' )]"
						using = Background_Area_Light
						alpha = 0.4
						margin_left = 4
						margin_right = 16
						margin_top = 1
						margin_bottom = 3
					}

					hbox = {
						margin_left = 5
						icon = {
							size = { 25 25 }
							texture = "[HouseUnityChangelogEntry.GetCurrentHouseUnityStageType.GetIcon]"
						}

						spacer = {
							size { 5 0 }
						}

						text_single = {
							text = "[HouseUnityChangelogEntry.GetProgress|+=]"
							align = nobaseline
							#margin_bottom = 5
						}
					}
				}
			}
		}

		expand = {}

		vbox = {
			layoutpolicy_horizontal = expanding
			layoutpolicy_vertical = expanding

			hbox = {
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding
				text_single = {
					block "change_value_text" {
						text = "HOUSE_UNITY_STAGE_CHANGE_VALUE_TRIGGER_CHARACTER"
					}
					align = nobaseline
				}
			}

			block "change_value_desc" {
				hbox = {
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					#visible = "[Not( HouseUnityChangelogEntry.GetNextHouseUnityStageType.IsValid )]"

					text_single = {
						text = "[HouseUnityChangelogEntry.GetDescription]"
						align = nobaseline
					}
				}
			}
		}
	}

	type house_unity_recent_changes_tooltip = object_tooltip_pop_out {

		#maximumsize = { 1000 600 }

		blockoverride "header_additions" { }

		blockoverride "title_text" {
			margin = { 0 8 }
			text = "HOUSE_UNITY_RECENT_CHANGES_LABEL"
			default_format = "#T"
		}

		blockoverride "concept_link" {
			text = ""
		}

		blockoverride "main_description" {
			vbox = {
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding

				visible = "[DataModelHasItems( DynastyHouseView.GetDynastyHouse.GetChangelog )]"
				datamodel = "[DataModelFirst( DynastyHouseView.GetDynastyHouse.GetChangelog, '(int32)13' )]"

				item = {
					vbox = {
						layoutpolicy_horizontal = expanding
						margin_bottom = 20

						hbox_house_unity_changelog_entry = {
							visible = "[HouseUnityChangelogEntry.GetNextHouseUnityStageType.IsValid]"
							background = {
								using = Background_Area_Dark
								#using = Color_Green
								alpha = 0.5
								margin_left = 4
								margin_right = 10
								margin_top = 15
								margin_bottom = -4
							}
							background = {
								visible = "[GreaterThan_int32( HouseUnityChangelogEntry.GetProgress, '(int32)0' )]"
								using = Background_Frame
								using = Color_Green
								alpha = 0.3
								margin_left = 4
								margin_right = 10
								margin_top = 15
								margin_bottom = -4
							}
							background = {
								visible = "[LessThanOrEqualTo_int32( HouseUnityChangelogEntry.GetProgress, '(int32)0' )]"
								using = Background_Frame
								using = Color_Red
								alpha = 0.5
								margin_left = 4
								margin_right = 10
								margin_top = 15
								margin_bottom = -4
							}
							blockoverride "icon_progress" {
								hbox = {
									margin_top = -20
									icon = {
										size = { 45 45 }
										texture = "[HouseUnityChangelogEntry.GetNextHouseUnityStageType.GetIcon]"
									}
								}
							}

							blockoverride "change_value_text" {
								text = "HOUSE_UNITY_STAGE_CHANGE_VALUE_TRIGGER_CHANGE_STAGE"
								layoutpolicy_vertical = expanding
								margin_bottom = 15
							}
							blockoverride "change_value_desc" {
							}
						}

						hbox_house_unity_changelog_entry = {}
					}
				}
			}

			vbox = {
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding

				visible = "[Not(DataModelHasItems( DynastyHouseView.GetDynastyHouse.GetChangelog ))]"

				text_single = {
					text = "HOUSE_UNITY_NO_RECENT_CHANGE_LABEL"
					layoutpolicy_vertical = expanding
					align = nobaseline
					margin_bottom = 20
				}
			}
		}
	}

	type hbox_access_domicile_button = hbox
	{
		button_round = {
			datacontext = "[Character.GetDomicile]"
			size = { 42 42 }

			onclick = "[ToggleGameViewData( 'domicile', Domicile.Self )]"
			tooltip = "[Domicile.GetMapPinTooltip( GetPlayer.Self )]"

			button_icon = {
				size = { 30 30 }
				parentanchor = center
				alwaystransparent = yes

				texture = "[Domicile.GetType.GetIcon]"
			}
		}
	}
}

template agot_show_cadet_house {
	visible = "[Not(DynastyHouse.IsFoundingHouse)]"
}

template agot_show_house_view {
	visible = "[DynastyHouse.HasBeenFounded]"
}
