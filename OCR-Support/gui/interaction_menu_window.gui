
window_ocr = {
	# gfxtype = windowgfx
	name = "character_interaction_menu_window"
	widgetid = "character_interaction_menu_window"
	alwaystransparent = yes
	layer = top
	allow_outside = yes
	visible_at_creation = no

	blockoverride "show_window" {
	}

	using = TooltipFocus

	state = {
		name = _show
		on_start = "[CloseGameView(AddTextIf(GetScriptedGui('close_interactions').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End ), 'character'))]"
		# on_finish = "[Clear('action_category')]"
	}

	state = {
		name = _hide
		on_finish = "[Set('favorite_interaction', 'yes')]"
		on_finish = "[Clear('filtered_actions')]"
	}

	# Not shown to the player, but is used by the hotkey system
	button_normal = {
		name = "button_close"
		size = { 0 0 }
		onclick = "[CharacterInteractionMenuWindow.Close]"
		using = close_window_ocr
	}
	blockoverride "ocr_margins" {

	}
	blockoverride "ocr_content" {
		flowcontainer = {
			layoutpolicy_horizontal = expanding
			direction = vertical
			ignoreinvisible = yes
			allow_outside = yes

			datacontext = "[CharacterInteractionMenuWindow.GetCharacter]"

			flowcontainer = {
				ignoreinvisible = yes
				visible = "[Or(Not(CharacterInteractionMenuWindow.AreMoreInteractionsVisisble), Is('action_category'))]"
				direction = vertical

				flowcontainer = {
					ignoreinvisible = yes
					direction = vertical
					visible = "[Not(GetVariableSystem.Exists('action_category'))]"

					widget = {
						datacontext = "[CharacterInteractionMenuWindow.GetCharacter]"
						size = { 100% 25 }
						name = "character_info"

						button_text = {
							using = char_click
							layoutpolicy_horizontal = expanding
							blockoverride "extra" {
								spacing = 3
								text_single = {
									raw_text = "Interact with"
								}
								text_single = {
									visible = "[And(Not(Character.IsLocalPlayer), Is('ocr'))]"
									raw_text = "[Character.GetFirstNameNoTooltip]"
								}
								text_single = {
									visible = "[And(Not(Character.IsLocalPlayer), Isnt('ocr'))]"
									raw_text = "[Character.GetUINameNoTooltip]."
								}

								text_single = {
									visible = "[Character.IsLocalPlayer]"
									raw_text = "yourself."
								}
							}
						}
					}

					flowcontainer = {
						ignoreinvisible = yes
						direction = vertical
						visible = "[Isnt('filtered_actions')]"

						button_text = {
							blockoverride "text" {
								raw_text = "[AddTextIf(Character.IsPinned, 'Un')]pin [Select_CString(Character.IsPinned, 'from', 'to')] outliner, hotkey O."
							}
							shortcut = mapmode_empires_secondary
							name = "button_pin"
							# visible = "[Not(Character.IsPinned)]"
							onclick = "[Character.ToggleCharacterPinned]"

							# tooltip = "PIN_TT"
							using = tooltip_se
						}

						widget = {
							size = { 500 23 }
							scissor = yes
							raw_tooltip = "[Character.GetDebugTooltip]"

							text_single = {
								margin_left = 5
								raw_text = "[Character.GetDebugTooltip]."
								position = { 0 -21 }
							}

							visible = "[InDebugMode]"
						}

						button_text = {
							blockoverride "text" {
								raw_text = "Rename."
							}
							name = "button_rename"
							datacontext = "[GetScriptedGui( 'rename_character_after_birth' )]"
							visible = "[Character.CanCharacterBeRenamed]"
							onclick = "[ScriptedGui.Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).AddScope( 'child', Character.MakeScope ).End  )]"
							onclick = "[CharacterInteractionMenuWindow.Close]"
							onclick = "[CloseGameView('character')]"

							# tooltip = "RENAME_CHARACTER"
							using = tooltip_ne
						}
						text_single = {
							visible = "[CharacterInteractionMenuWindow.OutsideDiplomaticRange]"
							tooltip = OUT_OF_DIPLOMACY_RANGE_TOOLTIP
							name = "label"
							text = OUT_OF_DIPLOMACY_RANGE
						}
					}
				}

				flow_agot_dragon_actions = {}

				flowcontainer = {
					ignoreinvisible = yes
					direction = vertical
					using = ocr

					# to prevent accidental clcks
					button = {
						shortcut = go_back
						visible = "[Not(GetVariableSystem.Exists('action_category'))]"
						clicksound =""
					}

					button = {
						visible = "[GetVariableSystem.Exists('action_category')]"
						clicksound =""
						shortcut = army_split_half
					}

					button_text = {
						visible = "[And(Not(GetVariableSystem.Exists('action_category')), Isnt('filtered_actions'))]"
						onclick = "[GetVariableSystem.Set('action_category', 'yes')]"
						shortcut = army_split_half
						blockoverride "text" {
							raw_text = "Filter by category, F."
						}
					}

					button_text = {
						visible = "[GetVariableSystem.Exists('action_category')]"
						onclick = "[GetVariableSystem.Clear('action_category')]"
						shortcut = go_back
						blockoverride "text" {
							raw_text = "Filtered, [GetVariableSystem.Get('action_category')]. Go back, B."
						}
					}
				}

				flowcontainer = {
					ignoreinvisible = yes
					direction = vertical
					visible = "[Isnt('filtered_actions')]"

					text_single = {
						visible = "[Isnt('favorite_interaction')]"
						raw_text = "See tooltips for more information."
					}

					text_single = {
						visible = "[Isnt('favorite_interaction')]"
						raw_text = "Right-click to favorite an action, updates when reopened."
					}
				}
			}

			### MORE INTERACTIONS
			text_single = {
				margin_left = 3
				layoutpolicy_horizontal = expanding
				raw_text = "[PdxGuiWidget.FindChild('items').GetChildrenCount] [Get('more_category')] Extras, [CountItems] enabled:"
				visible = "[And(CharacterInteractionMenuWindow.AreMoreInteractionsVisisble, Isnt('ocr'))]"

				hbox = {
					datamodel = "[CharacterInteractionMenuWindow.GetMoreInteractions]"
					name = "items"
					item = {
						hbox = {
							visible = "[InteractionItem.IsValid]"
						}
					}
				}

				hbox = {
					datamodel = "[CharacterInteractionMenuWindow.GetMoreInteractions]"
					name = "all_items"
					item = {
						hbox = {
							visible = "[InteractionItem.IsValid]"
						}
					}
				}
			}

			container = {
				name = "more_interactions_container"
				visible = "[CharacterInteractionMenuWindow.AreMoreInteractionsVisisble]"
				ignoreinvisible = yes

				container = {
					#this is used in code as an offset to its position
					position = { -5 30 }
					background = {
						using = vanilla
						texture = "gfx/interface/component_tiles/interaction_menu_bg.dds"
						spriteType = Corneredtiled
						spriteborder = { 11 11 }
						spriteborder_top = 49
						margin = { 15 12 }
						margin_bottom = 8
						margin_right = 5

						modify_texture = {
							name = "overlay"
							texture = "gfx/interface/component_overlay/overlay_window.dds"
							blend_mode = overlay
						}
					}
				}
				dynamicgridbox_interaction_list_ocr = {
					datamodel = "[CharacterInteractionMenuWindow.GetMoreInteractions]"
				}
			}

			flowcontainer = {
				name = "category_interaction_list"
				datamodel = "[CharacterInteractionMenuWindow.GetCategoryItems]"
				direction = vertical
				ignoreinvisible = yes
				# visible = "[Or(Not(GetVariableSystem.Exists('action_category')), GetVariableSystem.HasValue('action_category', InteractionCategoryItem.GetName))]"

				item = {
					flowcontainer_category_group_ocr = {}
				}
			}

			flowcontainer = {
				ignoreinvisible = yes
				direction = vertical
				visible = "[Isnt('filtered_actions')]"
				# visible = "[Not(GetVariableSystem.Exists('action_category'))]"

				button_text = {
					blockoverride "text" {
						raw_text = "Open memories"
						align = left
					}
					blockoverride "dot" { }
					datacontext = "[Character]"
					onclick = "[ToggleGameViewData( 'memories', Character.GetID  )]"
				}

				button_text = {
					name = "customize_portrait"
					blockoverride "text" {
						raw_text = "Open barbershop."
					}
					# visible = "[Character.CanCustomizePortrait]"
					onclick = "[Character.OnCustomizePortrait]"
					onclick = "[CharacterInteractionMenuWindow.Close]"
					using = tooltip_ne
				}

				text_single = {
					raw_text = "Settings:"
					margin_left = 3
					using = ocr
				}

				button_text = {
					visible = "[And(GetPlayer.IsValid, Isnt('ocr'))]"

					blockoverride "text" {
						raw_text = "Close character window when opening interactions."
					}
					blockoverride "pre" {
						spacing = 3
						text_single = {
							raw_text = "[Select_CString( GetScriptedGui('close_interactions').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End ), 'Checked', 'Unchecked')],"
						}
					}
					onclick = "[GetScriptedGui('close_interactions').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
				}
			}
		}
	}
}
