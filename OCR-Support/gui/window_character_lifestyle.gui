######################################################
################### LIFESTYLES #######################
######################################################

window = {
	name = "character_lifestyle_window"
	widgetid = "character_lifestyle_window"
	movable = no
	filter_mouse = all
	using = base_ocr_window
	layer = middle

	#TODO maybe we want different tooltip widgets for perks
	# vanilla uses character_trait_tooltip for finishers, and _selection for others which adds something to _contents

	datacontext = "[CharacterLifestyleWindow.GetCharacter]"
	datacontext = "[CharacterLifestyleWindow.GetSelectedLifestyle]"

	background = { using = Background_Area_Border_Solid }


	state = {
		name = _show
		using = Animation_FadeIn_Standard
		using = Sound_WindowShow_Standard
		using = Sound_Window_AmbienceMute_Snapshot

		on_start = "[GetVariableSystem.Set( 'lifestyle_open', 'true' )]"
		on_finish = "[Clear('change_lifestyle')]"
		on_finish = "[Clear('focused_perk_tree')]"
		on_finish = "[Clear('focus_on_perks')]"
	}

	state = {
		name = _hide
		using = Animation_FadeOut_Standard
		using = Sound_WindowHide_Standard

		on_start = "[GetVariableSystem.Clear( 'lifestyle_open' )]"
	}

	window_ocr = {
		button = {
			using = close_window_ocr
			onclick = "[CharacterLifestyleWindow.Close]"
			visible = "[Isnt('focused_perk_tree')]"
		}
		blockoverride "ocr_header" {
			header_standard = {
				visible = "[Or(Not( Lifestyle.IsValid ), Is('change_lifestyle'))]"
				layoutpolicy_horizontal = expanding

				blockoverride "header_text"
				{
					text = "CHARACTER_LIFESTYLE_HEADER"
				}

				blockoverride "button_close"
				{
					onclick = "[CharacterLifestyleWindow.Close]"
				}
			}

			vbox = {
				layoutpolicy_horizontal = expanding
				visible = "[And(And(Lifestyle.IsValid, Isnt('change_lifestyle')), Isnt('focused_perk_tree'))]"

				hbox = {
					layoutpolicy_horizontal = expanding
					spacing = 3
					text_single = {
						text = "LIFESTYLE_WINDOW_TITLE"
					}

					comma = {}

					text_single = {
						visible = "[Is('hide_foci')]"
						raw_text = "Perks."
					}

					hbox = {
						datamodel = "[CharacterLifestyleWindow.GetFocuses]"
						item = {
							text_single = {
								visible = "[EqualTo_string( FocusType.GetKey, Character.GetFocus.GetKey )]"
								raw_text = "[FocusType.GetName]."
							}
						}
					}

					expand = {}
				}

				button_text = {
					layoutpolicy_horizontal = expanding
					shortcut = army_merge
					onclick = "[Toggle('change_lifestyle')]"
					blockoverride "text" {
						raw_text = "Change lifestyle, G."
					}
				}


				flowcontainer = {
					layoutpolicy_horizontal = expanding
					allow_outside = yes
					visible = "[GreaterThan_int32( Character.GetPerkPoints( Lifestyle.Self ), '(int32)0' )]"
					ignoreinvisible = yes

					button_text = {
						shortcut = mapmode_duchies_secondary
						blockoverride "pre" {
							text_single = {
								text = "LIFESTYLE_POINTS_TO_USE_TEXT"
							}
							text_single = {
								raw_text = "."
							}
						}
						blockoverride "text" {
							raw_text = "Show only unlockable perks, U."
						}
						blockoverride "extra" {

							text_single = {
								margin_left = 3
								raw_text = "Warning, you need to select a focus before you can unlock perks."
								visible = "[Not( GetPlayer.GetLifestyle.IsValid )]"
							}
						}
						onclick = "[GetVariableSystem.Toggle('focus_on_perks')]"
						visible = "[Not(GetVariableSystem.Exists('focus_on_perks'))]"
					}

					button_text = {
						shortcut = mapmode_duchies_secondary
						blockoverride "text" {
							raw_text = "Show all perks, U."
						}
						onclick = "[GetVariableSystem.Clear('focus_on_perks')]"
						visible = "[GetVariableSystem.Exists('focus_on_perks')]"
					}
				}

				flowcontainer = {
					layoutpolicy_horizontal = expanding
					# visible = "[Not(GreaterThan_int32( Character.GetPerkPoints( Lifestyle.Self ), '(int32)0' ))]"
					spacing = 3

					container = {
						visible = "[Not(GreaterThan_int32( Character.GetPerkPoints( Lifestyle.Self ), '(int32)0' ))]"
						ignoreinvisible = yes

						button_text = {
							blockoverride "text" {
								raw_text = "Show all perks."
							}
							onclick = "[GetVariableSystem.Clear('focus_on_perks')]"
							visible = "[GetVariableSystem.Exists('focus_on_perks')]"
						}
					}

					text_single = {
						text = "UNLOCKED_PERKS"
					}
					text_single = {
						text = "EXPERIENCE"
					}
				}

				button_text = {
					layoutpolicy_horizontal = expanding
					shortcut = army_split_half

					blockoverride "text" {
						raw_text = "[Select_CString(GetVariableSystem.Exists('hide_foci'), 'Show', 'Hide')] focuses and [Select_CString(GetVariableSystem.Exists('hide_foci'), 'hide', 'show')] perks, F."
					}
					onclick = "[GetVariableSystem.Toggle('hide_foci')]"
				}
			}
		}

		blockoverride "ocr_content" {
			### Select Focus start screen
			vbox = {
				layoutpolicy_horizontal = expanding
				name = "lifestyle_selection"
				visible = "[Or(Not( Lifestyle.IsValid ), Is('change_lifestyle'))]"

				vbox = {
					layoutpolicy_horizontal = expanding
					datamodel = "[CharacterLifestyleWindow.GetLifestyles]"

					item = {
						vbox = {
							layoutpolicy_horizontal = expanding

							button_text = {
								layoutpolicy_horizontal = expanding
								onclick = "[CharacterLifestyleWindow.OpenLifestyle( Lifestyle.Self )]"
								onclick = "[PlaySfxEvent( Concatenate( 'event:/SFX/UI/Character/Lifestyle/sfx_ui_character_lifestyle_', Lifestyle.GetKey ) )]"
								onclick = "[Clear('change_lifestyle')]"

								shortcuts_list = {
									blockoverride "click" {
										onclick = "[Clear('change_lifestyle')]"
										onclick = "[CharacterLifestyleWindow.OpenLifestyle( Lifestyle.Self )]"
										onclick = "[PlaySfxEvent( Concatenate( 'event:/SFX/UI/Character/Lifestyle/sfx_ui_character_lifestyle_', Lifestyle.GetKey ) )]"
									}
								}
								blockoverride "pre" {
									text_single = {
										raw_text = "[IndexNumber],"
									}
								}
								blockoverride "extra" {
									text_single = {
										raw_text = "[Lifestyle.GetNameNoTooltip]."
									}
									text_single = {
										visible = "[Lifestyle.IsHighlightedForCharacter( Character.Self )]"
										raw_text = "[Lifestyle.GetHighlightDescription]"
									}
								}
							}

							hbox = {
								layoutpolicy_horizontal = expanding

								text_multi_wide = {
									text = "[Lifestyle.GetDescription]"
								}

								expand = { }
							}

							hbox = {
								layoutpolicy_horizontal = expanding
								spacing = 3
								visible = "[GreaterThan_int32( Character.GetPerkPointsUsed( Lifestyle.Self ), '(int32)0' )]"

								text_single = {
									raw_text = "[Character.GetPerkPointsUsed( Lifestyle.Self )] out of [Lifestyle.GetPerksInLifestyle] [perks|E]."
								}
								text_single = {
									text = "LIFESTYLE_POINTS_TO_USE_TEXT"
								}

								dot_l = { }

								expand = { }
							}
						}
					}
				}

				expand = { }
			}

			### Focus View
			vbox = {
				name = "focus_view"
				visible = "[And(Lifestyle.IsValid, Isnt('change_lifestyle'))]"
				layoutpolicy_horizontal = expanding

				state = {
					name = show_all_perks
					trigger_when = "[Not(GreaterThan_int32( Character.GetPerkPoints( Lifestyle.Self ), '(int32)0' ))]"
					on_start = "[GetVariableSystem.Clear('focus_on_perks')]"
				}

				### MAIN BODY
				vbox = {
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					margin_top = 10

					## LEFT BAR
					vbox = {
						visible = "[Not(GetVariableSystem.Exists('focus_on_perks'))]"
						layoutpolicy_horizontal = expanding

						vbox = {
							layoutpolicy_horizontal = expanding

							visible = "[Isnt('hide_foci')]"

							hbox = {
								layoutpolicy_horizontal = expanding
								visible = "[Not( GetPlayer.GetLifestyle.IsValid )]"
								text_single = {
									text = "FOCUS_CANCHANGE_NO_FOCUS"
								}
								dot = { }

								expand = { }
							}
							hbox = {
								layoutpolicy_horizontal = expanding

								text_multi_wide = {
									raw_text = "[GetLifestyleTooltipWarnings( GetPlayer )]."
									visible = "[GetPlayer.GetLifestyle.IsValid]"
								}

								expand = { }
							}
							vbox = {
								visible = "[Character.IsLocalPlayer]"

								text_multi_wide = {
									layoutpolicy_horizontal = expanding
									visible = "[Lifestyle.IsHighlightedForCharacter( Character.Self )]"
									text = "[Lifestyle.GetHighlightDescription]"
								}
							}
						}

						hbox = {
							layoutpolicy_horizontal = expanding

							vbox = {
								layoutpolicy_horizontal = expanding
								name = "focus_area"
								datamodel = "[CharacterLifestyleWindow.GetFocuses]"
								margin_top = 5

								item = {
									hbox = {
										layoutpolicy_horizontal = expanding

										button = {
											visible = "[Not(GetVariableSystem.Exists('hide_foci'))]"
											background = { using = Background_Area_Dark }

											enabled = "[Or(CharacterLifestyleWindow.CanSelectFocus( FocusType.Self ), EqualTo_string( FocusType.GetKey, Character.GetFocus.GetKey ))]"
											down = "[EqualTo_string( FocusType.GetKey, Character.GetFocus.GetKey )]"
											onclick = "[CharacterLifestyleWindow.SelectFocus( FocusType.Self )]"
											alwaystransparent = "[EqualTo_string( FocusType.GetKey, Character.GetFocus.GetKey )]"


											blockoverride "disabled" {}

											shortcuts_list = {
												blockoverride "click" {
													onclick = "[CharacterLifestyleWindow.SelectFocus( FocusType.Self )]"
												}
											}

											vbox = {
												margin = { 10 5 }
												margin_bottom = 10
												resizeparent = yes
												# spacing = 10

												hbox = {
													layoutpolicy_horizontal = expanding
													margin_top = 3
													spacing = 3

													text_single = {
														raw_text = "[IndexNumber],"
													}

													text_single = {
														raw_text = "[FocusType.GetNameNoTooltip]."
														alwaystransparent = yes
													}

													text_single = {
														visible = "[EqualTo_string( FocusType.GetKey, Character.GetFocus.GetKey )]"
														text = "CURRENT_FOCUS"
														margin_right = 5
													}

													text_single = {
														margin_right = 5
														raw_text = "Disabled."
														visible = "[Not(Or(CharacterLifestyleWindow.CanSelectFocus( FocusType.Self ), EqualTo_string( FocusType.GetKey, Character.GetFocus.GetKey )))]"
													}

													expand = { }
												}

												hbox = {
													layoutpolicy_horizontal = expanding

													text_multi_wide = {
														alwaystransparent = yes
														text = "LONG_FOCUS_TEXT"
													}

													expand = {}
												}
											}
										}

										expand = {}
									}
								}
							}
						}

						expand = {}
					}

					## Trees
					vbox = {
						datamodel = "[CharacterLifestyleWindow.GetPerkTrees]"
						layoutpolicy_horizontal = expanding
						visible = "[Or(Is('hide_foci'), Is('focus_on_perks'))]"

						flowcontainer = {
							layoutpolicy_horizontal = expanding
							ignoreinvisible = yes
							direction = vertical
							visible = "[Is('focus_on_perks')]"

							button_checked_text = {
								shortcut = map_mode_2
								onclick = "[Toggle('perk_connections')]"
								blockoverride "visible" {
									visible = "[Isnt('perk_connections')]"
								}
								blockoverride "text" {
									raw_text = "show paths, T."
								}
							}

							button_checked_text = {
								shortcut = map_mode_1
								onclick = "[Toggle('lifestyle_perk_desc')]"
								blockoverride "visible" {
									visible = "[Isnt('lifestyle_perk_desc')]"
								}
								blockoverride "text" {
									raw_text = "show effects, E."
								}
							}

						}

						item = {
							vbox = {
								layoutpolicy_horizontal = expanding
								visible = "[Or(Isnt('focused_perk_tree'), Has('focused_perk_tree', PerkGuiTree.GetName))]"

								button = {
									using = close_window_ocr
									onclick = "[Clear('focused_perk_tree')]"
									visible = "[Is('focused_perk_tree')]"
								}

								button_text = {
									layoutpolicy_horizontal = expanding
									onclick = "[Set('focused_perk_tree', PerkGuiTree.GetName)]"
									shortcuts_list = {
										blockoverride "click" {
											onclick = "[Set('focused_perk_tree', PerkGuiTree.GetName)]"
										}
									}
									blockoverride "num" {
										visible = "[Isnt('focused_perk_tree')]"
									}
									blockoverride "text" {
										raw_text = "[PerkGuiTree.GetName], [GetDataModelSize(PerkGuiTree.GetItems)] perks, [CountItems] unlocked."
										hbox = {
											datamodel = "[PerkGuiTree.GetItems]"
											name = "items"
											item = {
												hbox = {
													datacontext = "[Perk.GetUnlockTrait]"
													datacontext = "[Character.GetFaith]"
													datacontext = "[PerkLineItem.GetItem]"
													visible = "[Character.HasPerk( Perk.Self )]"
												}
											}
										}
									}
								}

								flowcontainer = {
									ignoreinvisible = yes
									visible = "[Is('focused_perk_tree')]"
									direction = vertical
									layoutpolicy_horizontal = expanding

									text_multi_wide = {
										raw_text = "Note that perk trees are not linear, see the structure below."
										# visible = "[Isnt('showed_perk_tree_tip')]"
									}

									button_checked_text = {
										onclick = "[Set('showed_perk_tree_tip', 'yes')]"
										shortcut = map_mode_2
										onclick = "[Toggle('perk_connections')]"
										blockoverride "visible" {
											visible = "[Isnt('perk_connections')]"
										}
										blockoverride "text" {
											raw_text = "show paths, T."
										}
									}

									button_checked_text = {
										shortcut = map_mode_1
										onclick = "[Toggle('lifestyle_perk_desc')]"
										blockoverride "visible" {
											visible = "[Isnt('lifestyle_perk_desc')]"
										}
										blockoverride "text" {
											raw_text = "show effects, E."
										}
									}
								}

								flowcontainer = {
									layoutpolicy_horizontal = expanding
									name = "perk_tree_item_line_area" # Name used in code do not change
									direction = vertical
									ignoreinvisible = yes
									visible = "[Or(Is('focus_on_perks'), Is('focused_perk_tree'))]"

									datamodel = "[PerkGuiTree.GetItems]"

									item = {
										flowcontainer = {
											ignoreinvisible = yes
											datacontext = "[PerkLineItem.GetItem]"
											direction = vertical
											datacontext = "[Perk.GetUnlockTrait]"
											datacontext = "[Character.GetFaith]"

											container = {
												ignoreinvisible = yes
												visible = "[Not(GetVariableSystem.Exists('focus_on_perks'))]"

												button_text = {
													onclick = "[CharacterLifestyleWindow.SelectPerk( Perk.Self )]"
													shortcuts_list = {
														blockoverride "click" {
															onclick = "[CharacterLifestyleWindow.SelectPerk( Perk.Self )]"
														}
													}
													tooltipwidget = {
														using = perk_tooltip_contents
													}
													enabled = "[And(CharacterLifestyleWindow.CanSelectPerk( Perk.Self ), Character.GetLifestyle.IsValid)]"
													blockoverride "num" {

													}
													blockoverride "pre" {
														spacing = 4
														text_single = {
															raw_text = "Unlock"
															visible = "[And(CharacterLifestyleWindow.CanSelectPerk( Perk.Self ), Character.GetLifestyle.IsValid)]"
														}
														text_single = {
															raw_text = "Trait"
															visible = "[Perk.IsFinisher]"
														}
													}
													blockoverride "text" {
														raw_text = "[Perk.GetNameNoTooltip( Character.Self )]."
														align = left
													}
													blockoverride "extra" {
														text_single = {
															raw_text = "Unlocked."
															visible = "[Character.HasPerk( Perk.Self )]"
														}

														flowcontainer = {
															ignoreinvisible = yes
															visible = "[Is('perk_connections')]"
															spacing = 3

															flowcontainer = {
																ignoreinvisible = yes
																spacing = 3
																visible = "[GreaterThan_int32(PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren, '(int32)0')]"

																text_single = {
																	raw_text = "leads to"
																}

																text_single = {
																	visible = "[GreaterThan_int32(PdxGuiWidget.AccessParent.AccessParent.FindChild('items').CountVisibleChildren, '(int32)1')]"
																	raw_text = "[PdxGuiWidget.AccessParent.AccessParent.FindChild('items').CountVisibleChildren]:"
																}
															}

															flowcontainer = {
																datamodel = "[PerkGuiTree.GetConnections]"
																name = "items"
																spacing = 3
																ignoreinvisible = yes
																item = {
																	flowcontainer = {
																		ignoreinvisible = yes
																		spacing = 3
																		visible = "[ObjectsEqual(PerkLineConnection.GetParent.GetItem, Perk.Self)]"
																		# text_single = {
																		# 	raw_text = "[Add_int32(PdxGuiWidget.GetIndexInDataModel, '(int32)2')],"
																		# }
																		text_single = {
																			raw_text = "[PerkLineConnection.GetChild.GetItem.GetName(Character.Self)],"
																		}
																	}
																}
															}
														}

														text_single = {
															visible = "[Perk.IsFinisher]"
															raw_text = "Finisher."
														}

														# text_single = {
														# 	raw_text = "Can't unlock."
														# 	visible = "[And(Not(Character.HasPerk( Perk.Self )), Not(CharacterLifestyleWindow.CanSelectPerk( Perk.Self )))]"
														# }
													}
												}
											}

											container = {
												ignoreinvisible = yes
												visible = "[GetVariableSystem.Exists('focus_on_perks')]"

												button_text = {
													onclick = "[CharacterLifestyleWindow.SelectPerk( Perk.Self )]"
													tooltipwidget = {
														using = perk_tooltip_contents
													}
													shortcuts_list = {
														blockoverride "click" {
															onclick = "[CharacterLifestyleWindow.SelectPerk( Perk.Self )]"
														}
													}
													visible = "[And(CharacterLifestyleWindow.CanSelectPerk( Perk.Self ), Character.GetLifestyle.IsValid)]"
													enabled = "[And(CharacterLifestyleWindow.CanSelectPerk( Perk.Self ), Character.GetLifestyle.IsValid)]"
													blockoverride "pre" {
														spacing = 4
														text_single = {
															raw_text = "Unlock"
															visible = "[And(CharacterLifestyleWindow.CanSelectPerk( Perk.Self ), Character.GetLifestyle.IsValid)]"
														}
														text_single = {
															raw_text = "trait"
															visible = "[Perk.IsFinisher]"
														}
													}
													blockoverride "text" {
														raw_text = "[Perk.GetNameNoTooltip( Character.Self )]."
														align = left
													}
													blockoverride "extra" {
														text_single = {
															raw_text = "Unlocked."
															visible = "[Character.HasPerk( Perk.Self )]"
														}

														flowcontainer = {
															ignoreinvisible = yes
															visible = "[Is('perk_connections')]"
															spacing = 3

															flowcontainer = {
																ignoreinvisible = yes
																spacing = 3
																visible = "[GreaterThan_int32(PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren, '(int32)0')]"

																text_single = {
																	raw_text = "leads to"
																}

																text_single = {
																	visible = "[GreaterThan_int32(PdxGuiWidget.AccessParent.AccessParent.FindChild('items').CountVisibleChildren, '(int32)1')]"
																	raw_text = "[PdxGuiWidget.AccessParent.AccessParent.FindChild('items').CountVisibleChildren]:"
																}
															}

															text_single = {
																visible = "[EqualTo_int32(PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren, '(int32)0')]"
																raw_text = "Finisher."
															}

															flowcontainer = {
																datamodel = "[PerkGuiTree.GetConnections]"
																name = "items"
																spacing = 3
																ignoreinvisible = yes
																item = {
																	flowcontainer = {
																		ignoreinvisible = yes
																		spacing = 3
																		visible = "[ObjectsEqual(PerkLineConnection.GetParent.GetItem, Perk.Self)]"
																		# text_single = {
																		# 	raw_text = "[Add_int32(PdxGuiWidget.GetIndexInDataModel, '(int32)2')],"
																		# }
																		text_single = {
																			raw_text = "[PerkLineConnection.GetChild.GetItem.GetName(Character.Self)],"
																		}
																	}
																}
															}
														}
														# text_single = {
														# 	raw_text = "Can't unlock."
														# 	visible = "[And(Not(Character.HasPerk( Perk.Self )), Not(CharacterLifestyleWindow.CanSelectPerk( Perk.Self )))]"
														# }
													}
												}
											}

											text_multi_wide = {
												visible = "[And(Is('lifestyle_perk_desc'), Or(Isnt('focus_on_perks'), CharacterLifestyleWindow.CanSelectPerk( Perk.Self )))]"
												raw_text = "[Perk.GetEffectDescription( GetPlayer )]"
											}
										}
									}
								}

								flowcontainer = {
									layoutpolicy_horizontal = expanding
									ignoreinvisible = yes
									direction = vertical
									visible = "[And(Has('focused_perk_tree', PerkGuiTree.GetName), Isnt('focus_on_perks'))]"
									margin_top = 5

									text_single = {
										layoutpolicy_horizontal = expanding
										raw_text = "Tree structure:"
									}

									flowcontainer = {
										ignoreinvisible = yes
										direction = vertical
										datamodel = "[PerkGuiTree.GetItems]"
										layoutpolicy_horizontal = expanding

										item = {
											flowcontainer = {
												ignoreinvisible = yes
												direction = vertical
												datacontext = "[PerkLineItem.GetItem]"
												datacontext = "[Perk.GetUnlockTrait]"
												datacontext = "[Character.GetFaith]"

												text_single = {
													visible = "[EqualTo_int32(PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren, '(int32)0')]"
													raw_text = "Starts with [Perk.GetName( Character.Self )]."
												}

												flowcontainer = {
													ignoreinvisible = yes
													datamodel = "[PerkGuiTree.GetConnections]"
													direction = vertical
													layoutpolicy_horizontal = expanding
													name = "items"

													item = {
														flowcontainer = {
															visible = "[ObjectsEqual(PerkLineConnection.GetChild.GetItem, Perk.Self)]"
															ignoreinvisible = yes
															direction = vertical

															container = {}
														}
													}
												}
											}
										}
									}

									flowcontainer = {
										ignoreinvisible = yes
										direction = vertical
										datamodel = "[PerkGuiTree.GetItems]"
										layoutpolicy_horizontal = expanding

										item = {
											flowcontainer = {
												ignoreinvisible = yes
												direction = vertical
												datacontext = "[PerkLineItem.GetItem]"
												datacontext = "[Perk.GetUnlockTrait]"
												datacontext = "[Character.GetFaith]"

												text_single = {
													visible = "[GreaterThan_int32(PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren, '(int32)1')]"
													raw_text = "Splits into [PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren] paths after [Perk.GetName( Character.Self )]."
												}

												flowcontainer = {
													ignoreinvisible = yes
													datamodel = "[PerkGuiTree.GetConnections]"
													direction = vertical
													layoutpolicy_horizontal = expanding
													name = "items"

													item = {
														flowcontainer = {
															visible = "[ObjectsEqual(PerkLineConnection.GetParent.GetItem, Perk.Self)]"
															ignoreinvisible = yes
															direction = vertical

															container = {}
														}
													}
												}
											}
										}
									}

									flowcontainer = {
										ignoreinvisible = yes
										direction = vertical
										datamodel = "[PerkGuiTree.GetItems]"
										layoutpolicy_horizontal = expanding

										item = {
											flowcontainer = {
												ignoreinvisible = yes
												direction = vertical
												datacontext = "[PerkLineItem.GetItem]"
												datacontext = "[Perk.GetUnlockTrait]"
												datacontext = "[Character.GetFaith]"

												text_single = {
													visible = "[GreaterThan_int32(PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren, '(int32)1')]"
													raw_text = "The [PdxGuiWidget.AccessParent.FindChild('items').CountVisibleChildren] paths merge into [Perk.GetName( Character.Self )]."
												}

												flowcontainer = {
													ignoreinvisible = yes
													datamodel = "[PerkGuiTree.GetConnections]"
													direction = vertical
													layoutpolicy_horizontal = expanding
													name = "items"

													item = {
														flowcontainer = {
															visible = "[ObjectsEqual(PerkLineConnection.GetChild.GetItem, Perk.Self)]"
															ignoreinvisible = yes
															direction = vertical

															container = {}
														}
													}
												}
											}
										}
									}

									flowcontainer = {
										ignoreinvisible = yes
										direction = vertical
										datamodel = "[PerkGuiTree.GetItems]"
										layoutpolicy_horizontal = expanding

										item = {
											flowcontainer = {
												ignoreinvisible = yes
												direction = vertical
												datacontext = "[PerkLineItem.GetItem]"
												visible = "[Perk.IsFinisher]"
												datacontext = "[Perk.GetUnlockTrait]"
												datacontext = "[Character.GetFaith]"

												text_single = {
													raw_text = "Ends with [Perk.GetName( Character.Self )]."
												}
											}
										}
									}

								}

								# a cursed attempt to show the structure
								# only works properly if there's only one starting perk
								flowcontainer = {
									ignoreinvisible = yes
									datamodel = "[PerkGuiTree.GetConnections]"
									direction = vertical
									layoutpolicy_horizontal = expanding
									visible = no

									item = {
										flowcontainer = {
											ignoreinvisible = yes
											visible = "[IsIndexFirst]"
											datacontext = "[PerkLineConnection.GetParent.GetItem]"
											direction = vertical

											perk_level = {
												blockoverride "level" {
													raw_text = "1,"
												}
											}
											perk_below = {
												blockoverride "level" {
													raw_text = "2,"
												}
												blockoverride "next" {
													perk_below = {
														blockoverride "level" {
															raw_text = "3,"
														}
														blockoverride "next" {
															perk_below = {
																blockoverride "level" {
																	raw_text = "4,"
																}
																blockoverride "next" {
																	perk_below = {
																		blockoverride "level" {
																			raw_text = "5,"
																		}
																		blockoverride "next" {
																			perk_below = {
																				blockoverride "level" {
																					raw_text = "6,"
																				}
																				blockoverride "next" {
																					perk_below = {
																						blockoverride "level" {
																							raw_text = "7,"
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
								}


								expand = { }
							}
						}
					}

					flowcontainer = {
						layoutpolicy_horizontal = expanding
						direction = vertical
						ignoreinvisible = yes
						visible = "[Or(Is('hide_foci'), Is('focus_on_perks'))]"

						button_text = {
							onclick = "[CharacterLifestyleWindow.OpenRefundPerks]"
							visible = "[And(And(And(CharacterLifestyleWindow.CanRefundPerks, Character.IsLocalPlayer), Isnt('focused_perk_tree')), Isnt('focus_on_perks'))]" #TODO enabled
							blockoverride "text" {
								raw_text = "REFUND_PERKS"
							}
							blockoverride "dot" {
							}
						}
					}


					expand = {}
				}
			}
		}
	}

	widget = {
		size  = { 100% 100% }
		visible = "[GetVariableSystem.Exists('ocr')]"
		window_lifestyle_old = {
		}
	}
}


types OCR {
	type perk_level = flowcontainer {
		ignoreinvisible = yes
		spacing = 3

		text_single = {
			block "level" {
				raw_text = "3,"
			}
		}

		text_single = {
			raw_text = "[Perk.GetName(Character.Self)],"
		}

		text_single = {
			raw_text = "[CountItems] children."
			flowcontainer = {
				datamodel = "[PerkGuiTree.GetConnections]"
				name = "items"
				item = {
					container = {
						visible = "[ObjectsEqual(PerkLineConnection.GetParent.GetItem, Perk.Self)]"
					}
				}
			}
		}
	}

	type perk_below =  flowcontainer {
		datamodel = "[PerkGuiTree.GetConnections]"
		direction = vertical

		item = {
			flowcontainer = {
				visible = "[ObjectsEqual(PerkLineConnection.GetParent.GetItem, Perk.Self)]"
				spacing = 3
				ignoreinvisible = yes

				flowcontainer = {
					datacontext = "[PerkLineConnection.GetChild.GetItem]"
					ignoreinvisible = yes
					direction = vertical

					perk_level = {
					}
					block "next" {}
				}
			}
		}
	}
}

types Lifestyle
{
	type progressbar_lifestyle_xp = progressbar_standard {
		parentanchor = vcenter
		size = { 500 20 }

		min = 0
		max = "[IntToFloat( Lifestyle.GetXpPerLevel )]"
		value = "[FixedPointToFloat( Character.GetLifestyleXp( Lifestyle.Self, '(bool)yes' ) )]"

		tooltip = "LIFESTYLE_XP_TOOLTIP"
		using = tooltip_below
	}

	type icon_lifestyle_unspent_points = icon {
		# set texture when used

		position = { 1 -6 }
		parentanchor = right
		size = { 40 40 }
		framesize = { 60 60 }
		frame = 2

		tooltip = "LIFESTYLE_POINTS_TOOLTIP"

		textbox = {
			size = { 100% 100% }
			align = center|nobaseline
			visible = "[GreaterThan_int32( Character.GetPerkPoints( Lifestyle.Self ), '(int32)0' )]"
			text = "[Character.GetPerkPoints( Lifestyle.Self )]"
			default_format = "#high;weak_glow"
			using = Font_Size_Big
		}

		textbox = {
			size = { 100% 100% }
			align = center|nobaseline
			visible = "[Not(GreaterThan_int32( Character.GetPerkPoints( Lifestyle.Self ), '(int32)0' ))]"
			text = "[Character.GetPerkPoints( Lifestyle.Self )]"
			default_format = "#low;weak_glow"
			using = Font_Size_Big
		}
	}
}
