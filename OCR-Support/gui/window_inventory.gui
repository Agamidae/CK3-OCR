window = {
	name = "inventory_view"
	widgetid = "inventory_view"
	size = { 100% 100% }
	layer = windows_layer
	movable = no
	visible = "[And( InventoryView.IsVisible, Not(IsGameViewOpen('barbershop')) )]"


	datacontext = "[GetVariableSystem]"
	datacontext = "[InventoryView.GetCharacter]"
	datacontext = "[InventoryView.GetCharacter.GetInventory]"

	state = {
		name = _show
		using = Animation_FadeIn_Standard
		on_start = "[GetVariableSystem.Clear( 'court_artifacts' )]"
		on_start = "[GetVariableSystem.Clear( 'claims' )]"
	}

	state = {
		name = _hide
		using = Animation_FadeOut_Standard
		on_finish = "[AccessLocalPlayerCachedData.AccessNewArtifacts.ClearNewArtifactsOfCategory( 'inventory' )]"
		on_finish = "[Clear('artifact_filters')]"
	}

	vbox = {
		using = fullscreen_window
		using = ocr_margins
		using = ocr
		using = Window_Background_No_Edge

		header_pattern = {
			layoutpolicy_horizontal = expanding

			blockoverride "header_text"
			{
				text = ""
			}

			blockoverride "button_close"
			{
				onclick = "[InventoryView.Close]"
			}

			flowcontainer = {
				layoutpolicy_horizontal = expanding
				ignoreinvisible = yes
				visible = "[Not(GetVariableSystem.Exists('all_artifacts'))]"

				button_text = {
				    blockoverride "text" {
			        raw_text = "INVENTORY_TITLE"
				    }
					blockoverride "extra" {
						text_single = {
							margin_left = -3
							raw_text = ","
						}

						text_single = {
							raw_text = "[Inventory.GetNumOfArtifactInCategory( 'inventory' )] artifacts,"
							datacontext = "[InventoryView.GetArtifactClaimsList]"
						}
					}

					onclick = "[GetVariableSystem.Clear('claims')]"
					onclick = "[GetVariableSystem.Clear('court_artifacts')]"
					onclick = "[GetVariableSystem.Clear('all_artifacts')]"
				}

				button_text = {
					layoutpolicy_horizontal = expanding
					visible = "[Not(Character.HasRoyalCourt)]"
					datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
					blockoverride "pre" {
						text_single = {
							visible = "[GreaterThan_int32( InventoryView.GetNumCourtArtifacts, '(int32)0' )]"
							text = "[InventoryView.GetNumCourtArtifacts]"
						}
					}
					blockoverride "text" {
						raw_text = "Court Artifacts, tab 4."
					}
					blockoverride "extra" {
						text_single = {
							visible = "[Is('court_artifacts')]"
							raw_text = "selected."
						}
					}
					shortcut = speed_4
					onclick = "[GetVariableSystem.Clear('claims')]"
					onclick = "[VariableSystem.Set( 'court_artifacts', 'yes' )]"
					onclick  = "[Clear('all_artifacts')]"
				}

				button_text = {
					layoutpolicy_horizontal = expanding
					visible = "[Character.HasRoyalCourt]"
					datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
					blockoverride "pre" {
						text_single = {
							visible = "[GreaterThan_int32( InventoryView.GetNumCourtArtifacts, '(int32)0' )]"
							text = "[InventoryView.GetNumCourtArtifacts]"
						}
					}
					blockoverride "text" {
						raw_text = "Court Artifacts, control Q."
					}
					shortcut = map_mode_5
					# onclick = "[VariableSystem.Set( 'artifacts_tab', 'artifacts' )]"
					onclick = "[GetVariableSystem.Set('royal_details', 'artifacts')]"
					onclick = "[Character.OpenRoyalCourtView( 'throne' )]"

					onclick = "[InventoryView.Close]"
					onclick = "[LocalPlayerNewArtifacts.ClearNewArtifactsOfCategory( 'court' )]"
				}

				button_text = {
					datacontext = "[InventoryView.GetArtifactClaimsList]"
					visible = "[DataModelHasItems(ArtifactClaimsList.GetClaims)]"
					blockoverride "text" {
						raw_text = "[GetDataModelSize(ArtifactClaimsList.GetClaims)] artifact claims, C."
					}
					shortcut = character_finder
					onclick = "[VariableSystem.Set( 'claims', 'yes' )]"
					onclick = "[VariableSystem.Clear( 'court_artifacts' )]"
					onclick = "[GetVariableSystem.Clear('all_artifacts')]"
				}

				button = {
					visible = "[Is('claims')]"
					shortcut = character_finder
					using = close_window_ocr
					onclick = "[Clear('claims')]"
				}

				button_text = {
					# visible = "[Isnt('artifact_filters')]"
					datacontext = "[InventoryView.GetArtifactClaimsList]"
					blockoverride "text" {
						raw_text = "All existing artifacts, L."
					}
					shortcut = explore_legends
					onclick = "[GetVariableSystem.Clear('claims')]"
					onclick = "[VariableSystem.Clear( 'court_artifacts' )]"
					onclick = "[GetVariableSystem.Set('all_artifacts', 'yes')]"
					onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
				}
			}

			flowcontainer = {
				ignoreinvisible = yes
				visible = "[Is('all_artifacts')]"

				button_text = {
					visible = "[GetVariableSystem.Exists('all_artifacts')]"
					layoutpolicy_horizontal = expanding
					blockoverride "text" {
						raw_text = "[GetDataModelSize(GetPlayer.MakeScope.GetList('all_artifacts'))]"
					}
					blockoverride "extra" {
						text_single = {
							raw_text = "headgears."
							visible = "[GetScriptedGui('filter_artifacts_helmet').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						}
						text_single = {
							raw_text = "regalia."
							visible = "[GetScriptedGui('filter_artifacts_regalia').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						}
						text_single = {
							raw_text = "armor."
							visible = "[GetScriptedGui('filter_artifacts_armor').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						}
						text_single = {
							raw_text = "weapons."
							visible = "[GetScriptedGui('filter_artifacts_primary_armament').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						}
						text_single = {
							raw_text = "trinkets."
							visible = "[GetScriptedGui('filter_artifacts_miscellaneous').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						}

						text_single = {
							raw_text = "artifacts."
							visible = "[GetScriptedGui('filter_artifacts_all').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						}
					}
					onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
					shortcut = map_mode_11

					datacontext = "[GetPlayer.MakeScope.Var('all_artifacts_page')]"
					datacontext = "[GetScriptedGui('all_artifacts_page')]"
					using = sgui_click_reset

					button = {
						using = close_window_ocr
						shortcut = explore_legends
						onclick = "[GetVariableSystem.Clear('all_artifacts')]"
					}
				}

				button_text = {
					onclick = "[GetScriptedGui('filter_artifacts_all').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
					onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
					blockoverride "text" {
						raw_text = "Show All, Control F."
					}
					shortcut = map_mode_15
					visible = "[Not(GetScriptedGui('filter_artifacts_all').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End ))]"
					datacontext = "[GetPlayer.MakeScope.Var('all_artifacts_page')]"
					datacontext = "[GetScriptedGui('all_artifacts_page')]"
					using = sgui_click_reset
				}

				button_text = {
					onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
					shortcut = map_mode_11

					datacontext = "[GetPlayer.MakeScope.Var('all_artifacts_page')]"
					datacontext = "[GetScriptedGui('all_artifacts_page')]"
					using = sgui_click_reset

					blockoverride "text" {
						raw_text = "Refresh list, hotkey Shift E. Close with Escape."
					}
				}
			}
		}

		vbox = {
			layoutpolicy_horizontal = expanding
			layoutpolicy_vertical = expanding

			error_button = {
				layoutpolicy_horizontal = expanding
			}

			# right side is other artifacts and claims
			vbox = {
				name = "right_side"
				layoutpolicy_vertical = expanding
				layoutpolicy_horizontal = expanding
				visible = "[Not(GetVariableSystem.Exists('all_artifacts'))]"

				# button_standard = {
				# 	text = "INVENTORY_TAB_CLAIMS_HIS_HER_MY"
				# 	enabled = "[And( DataModelHasItems( ArtifactClaimsList.GetClaims ), Not( InventoryView.HasSelectedSlot ) )]"
				# 	tooltip = "[SelectLocalization( DataModelHasItems( ArtifactClaimsList.GetClaims ), 'INVENTORY_TAB_CLAIMS_TOOLTIP', 'NO_ARTIFACT_CLAIMS' )]"
				# }


				hbox = {
					name = "claims_top_bar"
					visible = "[And( Not( InventoryView.HasSelectedSlot ), VariableSystem.Exists( 'claims' ) )]"
					layoutpolicy_horizontal = expanding

					button = {
						using = close_window_ocr
						onclick = "[GetVariableSystem.Clear('claims')]"
					}
				}

				vbox = {
					name = "equip_artifacts_top_bar"
					layoutpolicy_horizontal = expanding

					hbox = {
						layoutpolicy_horizontal = expanding
						spacing = 3
						button_text = {
							visible = "[And( Not( VariableSystem.Exists( 'claims' ) ), Not( VariableSystem.Exists( 'court_artifacts' ) ) )]"
							shortcut = army_split_half
							blockoverride "text" {
								raw_text = "Filters, hotkey F."
							}
							onclick = "[GetVariableSystem.Toggle('artifact_filters')]"
						}

						button_text = {
							shortcut = map_mode_1
							blockoverride "text" {
								raw_text = "[Select_CString(GetVariableSystem.Exists('artifact_effects'), 'Show', 'Hide')] effects, hotkey E."
							}
							onclick = "[GetVariableSystem.Toggle('artifact_effects')]"
						}

						button_text = {
							shortcut = mapmode_house_secondary
							blockoverride "text" {
								raw_text = "[Select_CString(GetVariableSystem.Exists('artifact_desc'), 'Hide', 'Show')] descriptions, Shift D."
							}
							onclick = "[GetVariableSystem.Toggle('artifact_desc')]"
						}

						text_single = {
							raw_text = "Click an artifact to equip or unequip."
							align = left
							visible = "[And(InventoryView.GetCharacter.IsLocalPlayer, Not(VariableSystem.Exists( 'claims' )))]"
						}

						expand = { }
					}

					hbox = {
						visible = "[GetVariableSystem.Exists('artifact_filters')]"
						layoutpolicy_horizontal = expanding

						hbox = {
							name = "artifact_slot_tabs"
							visible = "[And( Not( VariableSystem.Exists( 'claims' ) ), Not( VariableSystem.Exists( 'court_artifacts' ) ) )]"
							datamodel = "[InventoryView.GetUniqueInventorySlotTypes]"

							button_text = {
						    blockoverride "text" {
					        raw_text = "All [Inventory.GetNumOfArtifactInCategory( 'inventory' )] artifacts"
						    }
								blockoverride "extra" {
									text_single = {
										raw_text = ", Selected"
										visible = "[And(Not( InventoryView.HasSelectedSlot ), Isnt('court_artifacts'))]"
										align = left
									}
									dot = { }
								}
								onclick = "[InventoryView.ClearSelectedSlot]"
							}

							item = {
								button_text = {
									shortcuts_list = {
										blockoverride "click" {
											onclick = "[InventoryView.OnClickSlotTypeTab( InventorySlotType.Self )]"
										}
									}
									blockoverride "num" {
										visible = "[LessThan_int32(PdxGuiWidget.GetIndexInDataModel, '(int32)5')]"
									}
							    blockoverride "text" {
							        raw_text = "[InventorySlotType.GetName]"
							    }
									blockoverride "extra" {
										text_single = {
											raw_text = ", [LocalPlayerNewArtifacts.GetNumNewArtifactsOfSlot( InventorySlotType.GetSlotTypeString )]"
											visible = "[And( InventoryView.GetCharacter.IsLocalPlayer, GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfSlot( InventorySlotType.GetSlotTypeString ), '(int32)0' ) )]"
										}
										text_single = {
											raw_text = ", Selected"
											align = left
											visible = "[InventoryView.SelectedSlotHasType( InventorySlotType.Self )]"
										}
										dot = { }
									}
									datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
									datacontext = "[Inventory.GetSlot('crown')]"
									onclick = "[InventoryView.OnClickSlotTypeTab( InventorySlotType.Self )]"
									visible = "[InventorySlotType.IsInventoryType]"
								}
							}
						}

						expand = { }
					}
					button_text = {
						layoutpolicy_horizontal = expanding
						shortcut = map_mode_11
					    blockoverride "text" {
					        raw_text = "[AddTextIf(GetVariableSystem.Exists('equipped'), 'Don\'t ')]Show only equipped, Shift E."
					    }
						visible = "[Not(GetVariableSystem.Exists('claims'))]"
						onclick = "[GetVariableSystem.Toggle('equipped')]"
					}
				}

				vbox = {
					name = "court_artifacts_top_bar"
					visible = "[And( Not( InventoryView.HasSelectedSlot ), VariableSystem.Exists( 'court_artifacts' ) )]"
					layoutpolicy_horizontal = expanding
					margin = { 20 0 }
					spacing = 5


					hbox = {
						layoutpolicy_horizontal = expanding

						text_multi_wide = {
							layoutpolicy_horizontal = expanding
							datacontext = "[InventoryView.GetCharacter]"
							text = "CHARACTER_WITHOUT_ROYAL_COURT_COURT_ARTIFACT_TAB"
						}

						expand = { }
					}
				}

				hbox = {
					visible = "[GetVariableSystem.Exists('artifact_filters')]"
					layoutpolicy_horizontal = expanding

					hbox = {
						name = "artifact_sorting"
						visible = "[Not( VariableSystem.Exists( 'claims' ) )]"
						layoutpolicy_horizontal = expanding

						text_single = {
							raw_text = "Srot by"
						}

						dropdown_menu_standard = {
							name = "sort_artifacts"

							blockoverride "dropdown_properties"
							{
								datamodel = "[InventoryView.GetArtifactSortOptions]"
								onselectionchanged = "[InventoryView.SortArtifacts]"
								selectedindex = "[InventoryView.GetArtifactSortOptionsIndex]"
							}

							blockoverride "dropdown_active_item_properties"
							{
								text = "[Localize( CString.GetString )]"
								margin_top = 5
								margin_left = 3
							}

							blockoverride "dropdown_item_properties"
							{
								text = "[Localize( CString.GetString )]"
							}
						}

						button_text = {
							blockoverride "text" {
								raw_text = "[Select_CString(InventoryView.IsArtifactSortOrderDescending, 'In descending', 'In ascending')] order."
							}
							onclick = "[InventoryView.ToggleArtifactSortOrder]"
						}

						expand = { }
					}
				}

				hbox = { # claims sorting
					name = "claim_sorting"
					visible = "[VariableSystem.Exists( 'claims' )]"
					layoutpolicy_horizontal = expanding

					datacontext = "[InventoryView.GetArtifactClaimsList]"

					dropdown_menu_standard = {
						name = "sort_claims"

						blockoverride "dropdown_properties"
						{
							datamodel = "[ArtifactClaimsList.GetSortOptions]"
							onselectionchanged = "[ArtifactClaimsList.SortClaims]"
							selectedindex = "[ArtifactClaimsList.GetSortOptionsIndex]"
						}

						blockoverride "dropdown_active_item_properties"
						{
							raw_text = "Sort by [Localize( CString.GetString )]."
						}

						blockoverride "dropdown_item_properties"
						{
							raw_text = "[Localize( CString.GetString )]."
						}
					}

					button_text = {
						blockoverride "text" {
							raw_text = "[Select_CString(ArtifactClaimsList.IsSortOrderDescending, 'In descending', 'In ascending')] order."
						}
						onclick = "[ArtifactClaimsList.ToggleSortOrder]"
					}

					expand = { }
				}

				scrollbox = { # court artifacts
					name = "court_artifacts"
					visible = "[And( Not( InventoryView.HasSelectedSlot ), VariableSystem.Exists( 'court_artifacts' ) )]"
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding

					blockoverride "scrollbox_content" {
						vbox = {
							name = "artifacts_list"
							datamodel = "[InventoryView.GetSortedArtifacts]"
							layoutpolicy_horizontal = expanding

							item = {
								widget_artifact_entry_ocr = {
									layoutpolicy_horizontal = expanding
									visible = "[Artifact.IsCourtArtifact]"
									datacontext = "[InventoryView.GetCharacter.GetInventory]"
									datacontext = "[InventoryView.GetSelectedSlot]"

									blockoverride "background_button_overrides"
									{
										alwaystransparent = yes
										enabled = no
									}

									blockoverride "portrait" {
										expand = { minimumsize = { 0 0 } }
									}
								}
							}
						}
					}

					blockoverride "scrollbox_empty"
					{
						visible = "[IsDataModelEmpty( InventoryView.GetSortedArtifacts )]"
						text = "CHARACTER_HAS_NO_ARTIFACTS"
					}
				}

				scrollbox = { # artifact claims
					name = "artifact_claims"
					datacontext = "[InventoryView.GetArtifactClaimsList]"
					visible = "[And( Not( InventoryView.HasSelectedSlot ), VariableSystem.Exists( 'claims' ) )]"
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding

					blockoverride "scrollbox_content" {
						vbox = {
							name = "artifacts_list"
							datamodel = "[ArtifactClaimsList.GetClaims]"
							layoutpolicy_horizontal = expanding

							item = {
								artifact_claim_ocr = {
									layoutpolicy_horizontal = expanding
									datacontext = "[ArtifactClaim.GetArtifact]"
									datacontext = "[InventoryView.GetCharacter]"
								}
							}
						}
					}

					blockoverride "scrollbox_empty"
					{
						visible = "[IsDataModelEmpty( ArtifactClaimsList.GetClaims )]"
						text = "CHARACTER_HAS_NO_CLAIMED_ARTIFACTS"
					}
				}

				scrollbox = { # artifact list
					name = "artifacts"
					visible = "[And( Not( VariableSystem.Exists( 'court_artifacts' ) ), Not( VariableSystem.Exists( 'claims' ) ))]"
					layoutpolicy_vertical = expanding
					layoutpolicy_horizontal = expanding

					blockoverride "scrollbox_content" {
						vbox = {
							name = "equippable_artifacts_list"
							datamodel = "[InventoryView.GetSortedArtifacts]"
							layoutpolicy_horizontal = expanding
							spacing = 3

							text_single = {
								visible = "[GreaterThan_int32(PdxGuiWidget.CountVisibleChildren, '(int32)1')]"
								layoutpolicy_horizontal = expanding
								raw_text = "[Subtract_int32(PdxGuiWidget.AccessParent.CountVisibleChildren, '(int32)1')] new artifacts:"
							}

							item = {
								widget_artifact_entry_ocr = {
									name = "new_artifacts"
									layoutpolicy_horizontal = expanding
									datacontext = "[InventoryView.GetCharacter.GetInventory]"
									datacontext = "[InventoryView.GetSelectedSlot]"
									datacontext = "[InventoryView.GetSelectedSlot.GetType]"

									visible = "[And(And( Artifact.IsInventoryArtifact, Or(  Not( InventoryView.HasSelectedSlot ), InventorySlot.CanHoldArtifact( Artifact.Self ) ) ), LocalPlayerNewArtifacts.IsNewArtifact( Artifact.Self ))]"

									using = tooltip_es

									blockoverride "background_button_overrides"
									{
										onclick = "[InventoryView.OnClickArtifact( Artifact.Self )]"
										enabled = "[InventoryView.GetCharacter.IsLocalPlayer]"
										down = "[Inventory.IsEquipped( Artifact.Self )]"
									}

									blockoverride "portrait" {
										expand = { minimumsize = { 0 0 } }
									}
								}
							}
						}

						vbox = {
							datamodel = "[InventoryView.GetSortedArtifacts]"
							layoutpolicy_horizontal = expanding
							spacing = 3

							item = {
								widget_artifact_entry_ocr = {
									layoutpolicy_horizontal = expanding
									datacontext = "[InventoryView.GetCharacter.GetInventory]"
									datacontext = "[InventoryView.GetSelectedSlot]"
									datacontext = "[InventoryView.GetSelectedSlot.GetType]"

									visible = "[And(And( Artifact.IsInventoryArtifact, Or(  Not( InventoryView.HasSelectedSlot ), InventorySlot.CanHoldArtifact( Artifact.Self ) ) ), Not(LocalPlayerNewArtifacts.IsNewArtifact( Artifact.Self )))]"

									using = tooltip_es

									blockoverride "background_button_overrides"
									{
										onclick = "[InventoryView.OnClickArtifact( Artifact.Self )]"
										enabled = "[InventoryView.GetCharacter.IsLocalPlayer]"
										down = "[Inventory.IsEquipped( Artifact.Self )]"
									}

									blockoverride "portrait" {
										expand = { minimumsize = { 0 0 } }
									}
								}
							}
						}
					}

					blockoverride "scrollbox_empty"
					{
						visible = "[Or( Not( Inventory.HasAnyInventoryArtifact ), And( InventoryView.HasSelectedSlot, Not( Inventory.HasArtifactsOfSlotType( InventoryView.GetSelectedSlot.GetType ) ) ) )]"
						text = "CHARACTER_HAS_NO_ARTIFACTS"
						layoutpolicy_horizontal = expanding
					}
				}

				vbox = {
					layoutpolicy_horizontal = expanding
					visible = "[Not(GetVariableSystem.Exists('claims'))]"

					char_name = {
						layoutpolicy_horizontal = expanding
						datacontext = "[InventoryView.GetCharacter.GetCharacterEmployedAs( 'antiquarian_court_position' )]"
						visible = "[Character.IsValid]"
						blockoverride "text" {
							alwaystransparent = yes
							raw_text = "[GetCourtPositionType( 'antiquarian_court_position' ).GetName]: [Character.GetNameNoTooltip]."
						}
					}

					button_text = {
						layoutpolicy_horizontal = expanding
						visible = "[And(InventoryView.GetCharacter.IsLocalPlayer, Not(Character.IsValid))]"
						blockoverride "text" {
							text = "PORTRAIT_NO_ANTIQUARIAN"
						}
						datacontext = "[InventoryView.GetCharacter.GetCharacterEmployedAs( 'antiquarian_court_position' )]"
						onclick = "[ShowAppointCourtPositionIfNoEmployee( InventoryView.GetCharacter.GetID, 'antiquarian_court_position' )]"
					}

					button_text = {
						layoutpolicy_horizontal = expanding
						blockoverride "text" {
							raw_text = "[Decision.GetTitleForPlayer]. Enter."
						}
						name = "commission_decision"
						datacontext = "[GetDecisionWithKey('commission_artifact_decision')]"
						visible = "[And( Character.IsLocalPlayer, Decision.IsShownForPlayer )]"
						# onclick = "[InventoryView.Close]"
						onclick = "[OpenGameViewData( 'decision_detail', Decision.Self )]"
						shortcut = confirm
					}
				}

			}

			vbox = {
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding

				visible = "[GetVariableSystem.Exists('all_artifacts')]"

				vbox = {
					visible = "[Not(GetVariableSystem.Exists('all_artifacts_filters'))]"
					layoutpolicy_horizontal = expanding
					button_text = {
						layoutpolicy_horizontal = expanding
						blockoverride "text" {
							raw_text = "Sorted by [Select_CString(GetScriptedGui('sort_rarity').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End ), 'rarity', 'distance')]. Sort by [Select_CString(GetScriptedGui('sort_rarity').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End ), 'distance', 'rarity')]."
						}
						onclick = "[GetScriptedGui('sort_rarity').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"

						datacontext = "[GetPlayer.MakeScope.Var('all_artifacts_page')]"
					  datacontext = "[GetScriptedGui('all_artifacts_page')]"
						using = sgui_click_reset
					}

					hbox = {
						layoutpolicy_horizontal = expanding

						spacing = 1

						text_single = {
							raw_text = "Filter by type, use number keys:"
						}

						button_text = {
							onclick = "[GetScriptedGui('filter_artifacts_helmet').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							shortcut = speed_1

						    blockoverride "text" {
						        raw_text = "Headgear 1"
						    }
							blockoverride "extra" {
								text_single = {
									visible = "[GetScriptedGui('filter_artifacts_helmet').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
									raw_text = ", Selected"
									align = left
								}
								dot = { }
							}
						}

						button_text = {
							onclick = "[GetScriptedGui('filter_artifacts_regalia').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							shortcut = speed_2

						    blockoverride "text" {
						        raw_text = "Regalia 2"
						    }
							blockoverride "extra" {
								text_single = {
									visible = "[GetScriptedGui('filter_artifacts_regalia').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
									raw_text = ", Selected"
									align = left
								}
								dot = { }
							}
						}

						button_text = {
							onclick = "[GetScriptedGui('filter_artifacts_primary_armament').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							shortcut = speed_3

						    blockoverride "text" {
						        raw_text = "Weapons 3"
						    }
							blockoverride "extra" {
								text_single = {
									visible = "[GetScriptedGui('filter_artifacts_primary_armament').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
									raw_text = ", Selected"
									align = left
								}
								dot = { }
							}
						}

						button_text = {
							onclick = "[GetScriptedGui('filter_artifacts_armor').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							shortcut = speed_4

						    blockoverride "text" {
						        raw_text = "Armor 4"
						    }
							blockoverride "extra" {
								text_single = {
									visible = "[GetScriptedGui('filter_artifacts_armor').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
									raw_text = ", Selected"
									align = left
								}
								dot = { }
							}
						}

						button_text = {
							onclick = "[GetScriptedGui('filter_artifacts_miscellaneous').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
							shortcut = speed_5

						    blockoverride "text" {
						        raw_text = "Trinkets 5"
						    }
							blockoverride "extra" {
								text_single = {
									visible = "[GetScriptedGui('filter_artifacts_miscellaneous').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
									raw_text = ", Selected"
									align = left
								}
								dot = { }
							}
						}

						expand = { }
					}
				}

				hbox = {
					layoutpolicy_horizontal = expanding

					visible = no#"[GetVariableSystem.Exists('all_artifacts_filters')]"
					button = {
						onclick = "[GetScriptedGui('filter_artifacts_all').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						shortcut = decrease_speed_2
						visible = "[Not(GetScriptedGui('filter_artifacts_all').IsShown( GuiScope.SetRoot( GetPlayer.MakeScope ).End ))]"
					}

					button_text = {
						onclick = "[GetScriptedGui('filter_artifacts_helmet').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						shortcut = speed_1
					}

					button_text = {
						onclick = "[GetScriptedGui('filter_artifacts_regalia').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						shortcut = speed_2
					}

					button_text = {
						onclick = "[GetScriptedGui('filter_artifacts_primary_armament').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						shortcut = speed_3
					}

					button_text = {
						onclick = "[GetScriptedGui('filter_artifacts_armor').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						shortcut = speed_4
					}

					button_text = {
						onclick = "[GetScriptedGui('filter_artifacts_miscellaneous').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						onclick = "[GetScriptedGui('artifacts_list').Execute( GuiScope.SetRoot( GetPlayer.MakeScope ).End )]"
						shortcut = speed_5
					}

					expand = { }
				}

				# button_text = {
				# 	layoutpolicy_horizontal = expanding
				# 	blockoverride "text" {
				# 		raw_text = "[Select_CString(GetVariableSystem.Exists('all_artifacts_filters'), 'Show', 'Hide')] filters, Shift D."
				# 	}
				# 	onclick = "[GetVariableSystem.Toggle('all_artifacts_filters')]"
				# 	shortcut = mapmode_house_secondary
				# }

				scrollbox = {
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					blockoverride "scrollbox_margins" {
						margin_top = 20
					}

					blockoverride "scrollbox_content" {

						vbox_paged_list = {
							blockoverride "page_index" {
								datacontext = "[GetPlayer.MakeScope.Var('all_artifacts_page')]"
							}
						  datacontext = "[GetScriptedGui('all_artifacts_page')]"

						  blockoverride "full_datamodel" {
						    datamodel = "[GetPlayer.MakeScope.GetList('all_artifacts')]"
						  }
						  blockoverride "vbox_contents" {

								fixedgridbox = {
									addcolumn = 600
									addrow = 45
									layoutpolicy_horizontal = expanding
									# layoutpolicy_vertical = expanding

									datamodel = "[PageModelGlobal(GetPlayer.MakeScope.GetList('all_artifacts'))]"

									item = {
										widget = {
											size = { 600 42 }
											vbox = {
												layoutpolicy_horizontal = expanding
												spacing = -6
												button_text = {
													blockoverride "bg" { }
													layoutpolicy_horizontal = expanding
													datacontext = "[Scope.Artifact]"
													onclick = "[ToggleGameViewData( 'artifact_details', Artifact.GetID )]"
													blockoverride "pre" {
														page_index = {}
													}
													blockoverride "text" {
														raw_text = "[Artifact.GetNameNoTooltip], [AddTextIf(Artifact.IsUnique, 'Unique ')][Artifact.GetRarityAndType]."
													}
												}
												char_name = {
													blockoverride "bg" { }
													layoutpolicy_horizontal = expanding
													datacontext = "[Scope.Artifact.GetOwner]"
													blockoverride "extra" {
														text_single = {
															raw_text = "[Character.GetRelationToString( GetPlayer )]."
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

	window_inventory_vanilla = {
	}
}

types InventoryViewTypes
{
	type widget_inventory_slot = widget
	{
		size = { 150 140 }


		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"

		icon = { # Glow Effect
			#	visible = "[And(RoyalCourtWindow.IsSelectedSlot( InventorySlot.Self ), InventorySlot.IsEmpty)]"
			visible = "[InventoryView.IsSelectedSlot( InventorySlot.Self )]"
			size = { 120% 120% }
			texture = "gfx/interface/colors/white.dds"
			using = Color_Bright_Yellow
			alpha = 0.7
			parentanchor=center

			state = {
				name = _show
				using = Animation_Curve_Default
				duration = 0.3
				alpha = 0.7
			}

			state = {
				name = _hide
				using = Animation_Curve_Default
				duration = 0.6
				alpha = 0
			}

			state = {
				name = "a"
				next = "b"
				trigger_on_create = yes
				alpha = 0.7

				modify_texture = {
					name = "glow_1"
					rotate_uv = 0
				}

				modify_texture = {
					name = "glow_2"
					rotate_uv = 0
				}
			}

			state = {
				name = "b"
				next = "a"
				duration = 7

				modify_texture = {
					name = "glow_1"
					rotate_uv = 360
				}

				modify_texture = {
					name = "glow_2"
					rotate_uv = 360
				}
			}

			modify_texture = {
				name = "glow_1"
				texture = "gfx/interface/component_masks/mask_glow.dds"
				blend_mode = alphamultiply
			}

			modify_texture = {
				name = "glow_2"
				texture = "gfx/interface/component_masks/mask_glow.dds"
				blend_mode = alphamultiply
				mirror = horizontal
			}
		}

		widget = {
			using = Window_Background_NoDecoration
			size = {100% 100%}
		}

		text_single = {
			parentanchor = top|hcenter
			text = "[InventorySlot.GetName]"
			position = { 0 -6 }
		}

		button_artifact = {
			name = "equipped_artifact_button"
			datacontext = "[InventorySlot.GetArtifact]"
			visible = "[Not( InventorySlot.IsEmpty )]"
			parentanchor = center
			size = { 100 100 }

			using = tooltip_se

			down = "[InventoryView.IsSelectedSlot( InventorySlot.Self )]"

			blockoverride "on_click"
			{
				onclick = "[InventoryView.OnClickSlot( InventorySlot.Self )]"
				onclick = "[GetVariableSystem.Clear( 'court_artifacts' )]"
			}

			state = {
				name = _mouse_hierarchy_enter
				on_start = "[PdxGuiWidget.FindChild('unequip_button').TriggerAnimation('hover_enter')]"
			}

			state = {
				name = _mouse_hierarchy_leave
				on_start = "[PdxGuiWidget.FindChild('unequip_button').TriggerAnimation('hover_leave')]"
			}

			button_round = {
				name = "unequip_button"
				parentanchor = top|right
				size = { 30 30 }

				visible = "[And( Not(InventorySlot.IsEmpty), InventoryView.GetCharacter.IsLocalPlayer )]"
				alpha = 0

				state = {
					name = hover_enter
					alpha = 1
					duration = 0.4
					using = Animation_Curve_Default
				}

				state = {
					name = hover_leave
					alpha = 0
					duration = 0.6
					using = Animation_Curve_Default
				}

				onclick = "[InventoryView.Unequip( InventorySlot.GetArtifact )]"
				tooltip = "UNEQUIP_QUICK_TT"

				button_icon_highlight = {
					parentanchor = center
					size = { 30 30 }
					texture = "gfx/interface/icons/flat_icons/cancel_small.dds"
				}
			}
		}

		button_icon = {
			name = "empty_slot_button"
			datacontext = "[InventorySlot]"
			datacontext = "[InventoryView]"
			visible = "[And( InventorySlot.IsEmpty, InventoryView.GetCharacter.IsLocalPlayer )]"
			parentanchor = center
			size = { 60 60 }

			texture = "[InventorySlot.GetType.GetIcon]"
			spriteType = Corneredtiled
			spriteborder = { 2 2 }

			tooltip = "INVENTORY_SLOT_TT"
			onclick = "[InventoryView.ToggleSelectedSlot( InventorySlot.Self )]"
			onclick = "[GetVariableSystem.Clear( 'court_artifacts' )]"
			down = "[InventoryView.IsSelectedSlot( InventorySlot.Self )]"
		}

		button_round = {
			parentanchor = bottom|right
			position = { -20 -20 }
			size = { 20 20 }
			alwaystransparent = yes
			visible = "[And( InventoryView.GetCharacter.IsLocalPlayer, GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfSlot( InventorySlot.GetSlotTypeString ), '(int32)0' ) )]"

			text_single = {
				parentanchor = center
				text = "[LocalPlayerNewArtifacts.GetNumNewArtifactsOfSlot( InventorySlot.GetSlotTypeString )]"
				align = left
			}
		}

		widget = {
			parentanchor = bottom|hcenter
			position = { 0 10 }
			datacontext = "[InventorySlot.GetArtifact]"

			hbox = {
				visible = "[And( Not(InventorySlot.IsEmpty), Artifact.IsDurabilityLow) ]"
				spacing = 2
				tooltip = "[Artifact.GetDurabilityTooltip]"
				margin = { 8 3 }
				set_parent_size_to_minimum = yes

				icon_flat_standard = {
					size = { 20 20 }
					texture = "gfx/interface/icons/flat_icons/quality.dds"
				}

				expand = { }

				hbox = {
					spacing = 2

					text_single = {
						max_width = 80
						text = "ARTIFACT_YEARS_UNTIL_DECAY"
						using = Font_Size_Small
						align = left
					}

					expand = { }

					icon = {
						size = { 20 20 }
						texture = "gfx/interface/icons/symbols/icon_warning.dds"
					}
				}

				background = {
					margin = { 20 2 }

					texture = "gfx/interface/component_tiles/tile_title_bg_01.dds"
					spriteType = Corneredtiled
					spriteborder = { 40 8 }
					texture_density = 2

					modify_texture = {
						name = "mask"
						texture = "gfx/interface/component_masks/mask_fade_horizontal_middle_thick.dds"
						spriteType = Corneredstretched
						spriteborder = { 0 0 }
						blend_mode = alphamultiply
					}
				}
			}
		}
	}

	type widget_inventory_slot_tab = button_tab
	{
		size = { 90 42 }
		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
		down = "[InventoryView.SelectedSlotHasType( InventorySlotType.Self )]"
		onclick = "[InventoryView.OnClickSlotTypeTab( InventorySlotType.Self )]"
		tooltip = ARTIFACT_SORTING_TAB_TOOLTIP

		using = tooltip_above

		button_icon = {
			parentanchor = center
			position = { 0 2 }
			size = { 30 30 }
			texture = "[InventorySlotType.GetIcon]"
			alwaystransparent = yes
		}

		button_round = {
			parentanchor = bottom|right
			position = { -6 -4 }
			size = { 20 20 }
			alwaystransparent = yes
			visible = "[And( InventoryView.GetCharacter.IsLocalPlayer, GreaterThan_int32( LocalPlayerNewArtifacts.GetNumNewArtifactsOfSlot( InventorySlotType.GetSlotTypeString ), '(int32)0' ) )]"

			text_single = {
				parentanchor = center
				text = "[LocalPlayerNewArtifacts.GetNumNewArtifactsOfSlot( InventorySlotType.GetSlotTypeString )]"
				align = left
			}
		}
	}

	type hbox_artifact_durability = hbox
	{
		visible = "[Artifact.IsValid]"
		spacing = 2
		tooltip = "[Artifact.GetDurabilityTooltip]"

		icon_flat_standard = {
			size = { 20 20 }
			texture = "gfx/interface/icons/flat_icons/quality.dds"
		}

		progressbar_standard = {
			name = "durability_high"
			visible = "[Not( Artifact.IsDurabilityLow )]"
			size = { 100 10 }

			min = 0
			max = "[FixedPointToFloat( Artifact.GetMaxDurability )]"
			value = "[FixedPointToFloat( Artifact.GetDurability )]"
		}

		progressbar_standard = {
			name = "durability_low"
			visible = "[Artifact.IsDurabilityLow]"
			size = { 100 10 }

			min = 0
			max = "[FixedPointToFloat( Artifact.GetMaxDurability )]"
			value = "[FixedPointToFloat( Artifact.GetDurability )]"
		}

		hbox = {
			spacing = 4

			text_single = {
				visible = "[And( Artifact.ShouldDecay, GreaterThanOrEqualTo_int32( Artifact.GetYearsUntilDecay, '(int32)0' ) )]"
				max_width = 80
				text = "ARTIFACT_YEARS_UNTIL_DECAY"
				using = Font_Size_Small
				align = left
			}

			icon = {
				visible = "[Artifact.IsDurabilityLow]"
				size = { 20 20 }
				texture = "gfx/interface/icons/symbols/icon_warning.dds"
			}
		}

		expand = { }
	}

	type widget_artifact_entry = widget
	{
		# Requires
		# datacontext = character
		# datacontext = Inventory
		# datacontext = InventorySlot

		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
		datacontext = "[GetIllustration( 'artifact_regional_pattern' )]"
		size = { 560 110 }
		using = tooltip_above

		button_standard = {
			size = { 92% 100% }

			framesize = { 249 78 }
			spriteType = Corneredtiled
			spriteborder = { 10 10 }

			icon =  {
				texture = "[Illustration.GetTexture( Artifact.GetCulture.MakeScope )]"
				spriteType = Corneredtiled
				size = { 100% 15% }
				color = "[Artifact.GetRarityColor]"
				alpha = 0.2
				alwaystransparent = yes
			}

			icon =  {
				texture = "[Illustration.GetTexture( Artifact.GetCulture.MakeScope )]"
				spriteType = Corneredtiled
				size = { 100% 15% }
				color = "[Artifact.GetRarityColor]"
				alpha = 0.2
				alwaystransparent = yes
				parentanchor = bottom
			}

			block "button"
			{
				enabled = "[Character.IsLocalPlayer]"
				clicksound = "event:/DLC/EP1/SFX/UI/inventory_artifact_place"
			}

			block "overlay"
			{
				using = default_character_list_overlay
			}

			block "background_button_overrides" { }

			tooltipwidget = {
				artifact_tooltip = { }
			}

			using = tooltip_es

			block "new_artifact"
			{
				icon = {
					name = "new_artifact_glow"
					visible = "[LocalPlayerNewArtifacts.IsNewArtifact( Artifact.Self )]"
					parentanchor = center
					position = { 2 2 }
					size = { 100% 100% }

					state = {
						trigger_on_create = yes

						name = max_glow
						next = min_glow
						duration = 1
						using = Animation_Curve_Default
						alpha = 0.5
					}

					state = {
						name = min_glow
						next = max_glow
						duration = 1.6
						using = Animation_Curve_Default
						alpha = 0.3
					}

					background = {
						texture = "gfx/interface/component_effects/innovation_glow.dds"
						margin = { 15 13 }
						spriteType = Corneredstretched
						spriteborder = { 30 30 }
						tintcolor = { 1 0.8 0.6 1 }
					}
				}
			}
		}

		flowcontainer = {
			name = "equip_status"
			visible = "[Inventory.IsEquipped( Artifact.Self )]"
			parentanchor = top|right
			widgetanchor = top|right
			position = { -52 18 }

			allow_outside = yes

			text_single = {
				text = "EQUIPPED_ARTIFACT"
				align = right
				tooltip = "ARTIFACT_EQUIPPED_TOOLTIP"
				default_format = "#weak"
			}
		}

		hbox = {
			layoutpolicy_horizontal = expanding

			vbox = {
				name = "icon"
				layoutpolicy_vertical = expanding
				margin = { 2 2 }

				icon_artifact = {
					blockoverride "tooltipwidget" { }
				}

				block "new_artifact"
				{
					text_single = {
						visible = "[LocalPlayerNewArtifacts.IsNewArtifact( Artifact.Self )]"
						margin_top = -14
						text = "NEW_ARTIFACT"
						align = left

						tooltip = "NEW_ARTIFACT_TOOLTIP"
					}
				}
			}

			vbox = {
				name = "text"
				layoutpolicy_vertical = expanding
				margin_top = 4
				margin_bottom = 10

				expand = { }

				text_single = {
					layoutpolicy_horizontal = expanding
					text = "[Artifact.GetRarityAndSlotType]"
					max_width = 300
					using = Font_Size_Small
				}

				text_multi = {
					layoutpolicy_horizontal = expanding
					text = "[Artifact.GetNameNoTooltip]"
					autoresize = yes
					max_width = 350
					using = Font_Size_Medium
					default_format = "#high"
					alwaystransparent = yes
				}

				spacer = {
					size = { 0 6 }
				}

				hbox_artifact_durability = {
					layoutpolicy_horizontal = expanding
					# simple tooltip override so that the durability tooltip doesnt show up here
					tooltip = ""
				}

				expand = { }
			}

			expand = { }
		}

		widget = {
			name = "horizontal_hostile_minor_buttons"
			visible = "[And( Not( Artifact.GetOwner.IsLocalPlayer ), Artifact.HasClaim( GetPlayer ) )]"
			parentanchor = center
			position = { 112 14 }
			allow_outside = yes

			hbox = {
				layoutpolicy_horizontal = expanding
				spacing = 2

				button_round = {
					name = "steal"
					size = { 35 35 }

					button_icon_highlight = {
						parentanchor = center
						size = { 25 25 }
						texture = "gfx/interface/icons/flat_icons/scheme.dds"
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('start_stealing_back_artifact')]"
					onclick = "[Artifact.GetOwner.OpenPlayerInteraction('start_stealing_back_artifact')]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip( 'start_stealing_back_artifact' )]"
				}

				button_round = {
					name = "declare_war"
					size = { 35 35 }

					button_icon_highlight = {
						size = { 25 25 }
						parentanchor = center
						texture = "gfx/interface/icons/flat_icons/declare_war.dds"
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('declare_war_interaction')]"
					onclick = "[Artifact.GetOwner.OpenDeclareWarViewWithArtifactCB]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('declare_war_interaction')]"
				}

				button_round = {
					name = "duel"
					size = { 35 35 }

					button_icon_highlight = {
						parentanchor = center
						size = { 25 25 }
						texture = "gfx/interface/icons/flat_icons/duel.dds"
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('challenge_for_artifact_interaction')]"
					onclick = "[Artifact.GetOwner.OpenPlayerInteraction('challenge_for_artifact_interaction')]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('challenge_for_artifact_interaction')]"
				}

				expand = { }
			}
		}

		widget = {
			name = "round_buttons"
			size = { 40 74 }
			parentanchor = right|vcenter
			position = { 2 0 }
			allow_outside = yes

			datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"

			vbox = {
				layoutpolicy_vertical = expanding

				button_round = {
					name = "reforge"
					size = { 35 35 }

					button_icon_highlight = {
						size = { 25 25 }
						parentanchor = center
						texture = "gfx/interface/icons/flat_icons/reforge.dds"
					}
					visible = "[Artifact.GetOwner.IsLocalPlayer]"

					onclick = "[ToggleGameViewData( 'reforge_artifact', Artifact.GetID )]"
					onclick = "[LocalPlayerNewArtifacts.RemoveNewArtifact( Artifact.Self )]"
					enabled = "[Artifact.CanReforgeOrRepair( Artifact.GetOwner.Self )]"
					tooltip = "[Artifact.GetReforgeOrRepairTooltip( Artifact.GetOwner.Self )]"

					icon = {
						name = "selection_glow"
						visible = "[Artifact.IsDurabilityLow]"
						parentanchor = center
						size = { 45 45 }

						state = {
							trigger_on_create = yes

							name = max_glow
							next = min_glow
							duration = 1
							using = Animation_Curve_Default
							alpha = 0.5
						}

						state = {
							name = min_glow
							next = max_glow
							duration = 1.6
							using = Animation_Curve_Default
							alpha = 0.3
						}

						background = {
							texture = "gfx/interface/component_masks/mask_fade_circle.dds"
							tintcolor = { 1 0.8 0.6 1 }
						}
					}
				}

				button_round = {
					name = "destroy"

					size = { 35 35 }

					button_icon_highlight = {
						size = { 25 25 }
						parentanchor = center
						texture = "gfx/interface/icons/flat_icons/destroy_artifact.dds"
					}

					visible = "[Character.IsPlayerInteractionShown( 'destroy_artifact_interaction' )]"
					enabled = "[Character.IsPlayerInteractionWithTargetArtifactValid( 'destroy_artifact_interaction', Artifact.Self )]"
					onclick = "[Character.OpenPlayerInteractionWithTargetArtifact( 'destroy_artifact_interaction', Artifact.Self )]"
					tooltip = "[Character.GetPlayerInteractionWithTargetArtifactTooltip( 'destroy_artifact_interaction', Artifact.Self )]"
				}

				button_round = {
					name = "details"
					size = { 35 35 }

					button_icon_highlight = {
						parentanchor = center
						position = { 0 -6 }
						size = { 25 25 }
						texture = "gfx/interface/icons/flat_icons/dots.dds"
					}

					onclick = "[ToggleGameViewData( 'artifact_details', Artifact.GetID )]"
					onclick = "[LocalPlayerNewArtifacts.RemoveNewArtifact( Artifact.Self )]"
					tooltip = "ARTIFACT_DETAILS"
				}
			}
		}
	}

	type widget_artifact_entry_ocr = vbox
	{
		# Requires
		# datacontext = character
		# datacontext = Inventory
		# datacontext = InventorySlot

		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
		datacontext = "[GetIllustration( 'artifact_regional_pattern' )]"

		vbox = {
			layoutpolicy_horizontal = expanding
			visible = "[Or(Not(GetVariableSystem.Exists('equipped')), And(GetVariableSystem.Exists('equipped'), Inventory.IsEquipped( Artifact.Self )))]"
			hbox = {
				layoutpolicy_horizontal = expanding

				vbox = {
					name = "text"
					layoutpolicy_horizontal = expanding

					button_text = {
						layoutpolicy_horizontal = expanding
						blockoverride "pre" {

							# text_single = {
							# 	raw_text = "[IndexNumber], "
							# }
							block "index" {}
							flowcontainer = {
								ignoreinvisible = yes
								visible = "[Inventory.IsEquipped( Artifact.Self )]"

								text_single = {
									text = "EQUIPPED_ARTIFACT"
								}

								text_single = {
									raw_text = ","
								}
							}

							block "new_artifact"
							{
								flowcontainer = {
									ignoreinvisible = yes
									visible = "[LocalPlayerNewArtifacts.IsNewArtifact( Artifact.Self )]"

									text_single = {
										text = "NEW_ARTIFACT"
									}

									dot = { }
								}
							}
						}

						blockoverride "extra" {
							text_single = {
								margin_left = -2
								raw_text = "[AddTextIf(StringIsEmpty(Artifact.GetNameNoTooltip),'Unnamed')][Artifact.GetNameNoTooltip],"
							}
							text_single = {
								raw_text = "[Artifact.GetRarityAndSlotType]."
							}
						}
						block "background_button_overrides" {

						}
						block "button"
						{
							enabled = "[Character.IsLocalPlayer]"
							clicksound = "event:/DLC/EP1/SFX/UI/inventory_artifact_place"
						}
					}

					hbox = {
						layoutpolicy_horizontal = expanding

						text_multi = {
							block "artifact_effects" {
								visible = "[Not(GetVariableSystem.Exists('artifact_effects'))]"
							}
							text = "[Artifact.GetModifierEffects]"
							autoresize = yes
							max_width = 600
							margin_left = 5
						}

						expand = { }
					}

					hbox = {
						layoutpolicy_horizontal = expanding

						text_multi = {
							block "court" {
								visible = "[GetVariableSystem.Exists('artifact_desc')]"
							}
							text = "[Artifact.GetDesc]"
							autoresize = yes
							max_width = 600
							margin_left = 5
						}

						expand = { }
					}

					hbox = {
						layoutpolicy_horizontal = expanding
						spacing = 3

						block "court" {}

						button_text = {
							blockoverride "text" {
								raw_text = "View details."
							}
							onclick = "[ToggleGameViewData( 'artifact_details', Artifact.GetID )]"
							onclick = "[LocalPlayerNewArtifacts.RemoveNewArtifact( Artifact.Self )]"
						}

						hbox = {
							layoutpolicy_horizontal = expanding
							visible = "[Artifact.IsValid]"
							tooltip = "[Artifact.GetDurabilityTooltip]"
							text_single = {
								raw_text = "Does not decay."
								visible = "[Not(Artifact.ShouldDecay)]"
							}


							text_single = {
								visible = "[And( Artifact.ShouldDecay, GreaterThanOrEqualTo_int32( Artifact.GetYearsUntilDecay, '(int32)0' ) )]"
								text = "ARTIFACT_YEARS_UNTIL_DECAY"
							}

							space = { }

							text_single = {
								visible = "[And( Artifact.ShouldDecay, GreaterThanOrEqualTo_int32( Artifact.GetYearsUntilDecay, '(int32)0' ) )]"
								raw_text = "of durability left."
							}

							text_single = {
								raw_text = ""
							}

							# in case a unique gets damaged
							text_single = {
								raw_text = ", durability [Artifact.GetDurability]"
								visible = "[And(GreaterThan_CFixedPoint(Artifact.GetMaxDurability, Artifact.GetDurability), Not(Artifact.ShouldDecay))]"
							}

							text_single = {
								raw_text = " Maximum is [Artifact.GetMaxDurability]."
								visible = "[GreaterThan_CFixedPoint(Artifact.GetMaxDurability, Artifact.GetDurability)]"
							}

							expand = { }
						}

						expand = { }
					}
					hbox = {
				    layoutpolicy_horizontal = expanding
						block "destroy" {}
						button_text = {
							datacontext = "[GetPlayer]"
							layoutpolicy_horizontal = expanding
							blockoverride "text" {
								raw_text = "INVENTORY_DESTROY_ARTIFACT"
							}
							blockoverride "disabled" {
								visible = "[Not(Character.IsPlayerInteractionWithTargetArtifactValid( 'destroy_artifact_interaction', Artifact.Self ))]"
							}
							blockoverride "dot" {
							}
							visible = "[And(Character.IsPlayerInteractionShown( 'destroy_artifact_interaction' ), Character.IsPlayerInteractionWithTargetArtifactValid( 'destroy_artifact_interaction', Artifact.Self ))]"
							enabled = "[Character.IsPlayerInteractionWithTargetArtifactValid( 'destroy_artifact_interaction', Artifact.Self )]"
							onclick = "[Character.OpenPlayerInteractionWithTargetArtifact( 'destroy_artifact_interaction', Artifact.Self )]"
							tooltip = "[Character.GetPlayerInteractionWithTargetArtifactTooltip( 'destroy_artifact_interaction', Artifact.Self )]"
						}

					    expand = { }
					}

					flowcontainer = {
						layoutpolicy_horizontal = expanding
						ignoreinvisible = yes
						# block "court" {
						# }
						visible = "[Artifact.IsValid]"
						tooltip = "[Artifact.GetDurabilityTooltip]"

						button_text = {
							blockoverride "disabled" {
								visible = "[Not(Artifact.CanReforgeOrRepair( Artifact.GetOwner.Self ))]"
								align = left
							}
							blockoverride "text" {
								raw_text = "Repair."
								align = left
								margin_right = 3
							}
							visible = "[And(Artifact.GetOwner.IsLocalPlayer, GreaterThan_CFixedPoint(Artifact.GetMaxDurability, Artifact.GetDurability))]"

							onclick = "[ToggleGameViewData( 'reforge_artifact', Artifact.GetID )]"
							onclick = "[LocalPlayerNewArtifacts.RemoveNewArtifact( Artifact.Self )]"
							enabled = "[Artifact.CanReforgeOrRepair( Artifact.GetOwner.Self )]"
							tooltip = "[Artifact.GetReforgeOrRepairTooltip( Artifact.GetOwner.Self )]"
						}
					}

					expand = { }
				}

				expand = { }
			}

			block "owner" { }

			hbox = {
				visible = "[And( Not( Artifact.GetOwner.IsLocalPlayer ), Artifact.HasClaim( GetPlayer ) )]"
				layoutpolicy_horizontal = expanding
				spacing = 2

				block "claim" {
					text_single = {
						raw_text = "You have a claim."
						align = left
					}
				}


				button_text = {
					blockoverride "disabled" {
						visible = "[Not(Artifact.GetOwner.IsPlayerInteractionValid('start_stealing_back_artifact'))]"
					}
					blockoverride "text" {
						raw_text = "Steal artifact."
					}
					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('start_stealing_back_artifact')]"
					onclick = "[Artifact.GetOwner.OpenPlayerInteraction('start_stealing_back_artifact')]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip( 'start_stealing_back_artifact' )]"
				}

				button_text = {
					blockoverride "disabled" {
						visible = "[Not(Artifact.GetOwner.IsPlayerInteractionValid('declare_war_interaction'))]"
					}
					blockoverride "text" {
						raw_text = "Declare war."
					}
					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('declare_war_interaction')]"
					onclick = "[Artifact.GetOwner.OpenDeclareWarViewWithArtifactCB]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('declare_war_interaction')]"
				}

				button_text = {
					blockoverride "disabled" {
						visible = "[Not(Artifact.GetOwner.IsPlayerInteractionValid('challenge_for_artifact_interaction'))]"
					}
					blockoverride "text" {
						raw_text = "Challenge in duel."
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('challenge_for_artifact_interaction')]"
					onclick = "[Artifact.GetOwner.OpenPlayerInteraction('challenge_for_artifact_interaction')]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('challenge_for_artifact_interaction')]"
				}


				expand = { }
			}
		}

	}

	type artifact_claim = widget
	{
		# Requires
		# datacontext = Inventory
		# datacontext = InventorySlot

		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"

		size = { 560 118 }
		using = tooltip_es

		widget = {
			name = "background"
			size = { 78% 100% }

			background = {
				using = Background_Area_Dark
			}

			tooltipwidget = {
				artifact_tooltip = { }
			}
		}

		widget = {
			name = "detail_button"
			parentanchor = center
			position = { 160 -16 }
			allow_outside = yes

			button_round = {
				name = "details"
				size = { 35 35 }

				onclick = "[ToggleGameViewData( 'artifact_details', Artifact.GetID )]"
				onclick = "[LocalPlayerNewArtifacts.RemoveNewArtifact( Artifact.Self )]"
				tooltip = "ARTIFACT_DETAILS"

				button_icon_highlight = {
					parentanchor = center
					position = { 0 -6 }
					size = { 25 25 }
					texture = "gfx/interface/icons/flat_icons/dots.dds"
				}
			}
		}

		widget = {
			name = "horizontal_icons"
			parentanchor = center
			position = { 40 15 }
			allow_outside = yes

			hbox = {
				visible = "[And( Not( Artifact.GetOwner.IsLocalPlayer ), Artifact.HasClaim( GetPlayer ) )]"
				layoutpolicy_horizontal = expanding
				spacing = 2

				button_round = {
					name = "steal"
					size = { 35 35 }

					button_icon_highlight = {
						parentanchor = center
						size = { 25 25 }
						texture = "gfx/interface/icons/flat_icons/scheme.dds"
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('start_stealing_back_artifact')]"
					onclick = "[Artifact.GetOwner.OpenPlayerInteraction('start_stealing_back_artifact')]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('start_stealing_back_artifact')]"

					using = tooltip_below
				}

				button_round = {
					name = "declare_war"
					size = { 35 35 }

					button_icon_highlight = {
						size = { 25 25 }
						parentanchor = center
						texture = "gfx/interface/icons/flat_icons/declare_war.dds"
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('declare_war_interaction')]"
					onclick = "[Artifact.GetOwner.OpenDeclareWarViewWithArtifactCB]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('declare_war_interaction')]"
					using = tooltip_below
				}

				button_round = {
					name = "duel"
					size = { 35 35 }

					button_icon_highlight = {
						parentanchor = center
						size = { 25 25 }
						texture = "gfx/interface/icons/flat_icons/duel.dds"
					}

					enabled = "[Artifact.GetOwner.IsPlayerInteractionValid('challenge_for_artifact_interaction')]"
					onclick = "[Artifact.GetOwner.OpenPlayerInteraction('challenge_for_artifact_interaction')]"
					tooltip = "[Artifact.GetOwner.GetPlayerInteractionTooltip('challenge_for_artifact_interaction')]"
				}

				expand = { }
			}
		}

		widget = {
			name = "item_and_owner"
			size = { 425 118 }

			hbox = {
				layoutpolicy_horizontal = expanding
				layoutpolicy_vertical = expanding
				parentanchor = left
				margin = { 2 2 }

				vbox = {
					layoutpolicy_vertical = expanding

					icon_artifact = {
						blockoverride "tooltipwidget" { }
					}

					expand = { }
				}

				vbox = {
					layoutpolicy_horizontal = expanding
					layoutpolicy_vertical = expanding
					margin_top = 4

					hbox = {
						layoutpolicy_horizontal = expanding

						text_single = {
							name = "rarity"
							layoutpolicy_horizontal = expanding
							text = "[Artifact.GetRarityAndType]"
							max_width = 190
							using = Font_Size_Small
						}

						expand = { }

						text_single = {
							name = "house_claim"
							layoutpolicy_horizontal = expanding
							visible = "[ArtifactClaim.IsHouseClaim]"
							text = "ARTIFACT_HOUSE_CLAIM"
							align = right
							max_width = 130
						}

						text_single = {
							name = "personal_claim"
							layoutpolicy_horizontal = expanding
							visible = "[ArtifactClaim.IsPersonalClaim]"
							text = "ARTIFACT_PERSONAL_CLAIM"
							align = right
							max_width = 130
						}
					}

					hbox = {
						layoutpolicy_horizontal = expanding

						text_multi = {
							text = "[Artifact.GetNameNoTooltip]"
							autoresize = yes
							max_width = 300
							using = Font_Size_Medium
							default_format = "#high"
						}

						expand = { }
					}

					hbox_artifact_durability = {
						layoutpolicy_horizontal = expanding
						margin_left = -3
						margin_top = 8
						# simple tooltip override so that the durability tooltip doesnt show up here
						tooltip = ""

						expand = { }
					}

					expand = { }
				}
			}
		}

		widget = {
			name = "portrait_artifact_owner"
			size = { 90 110 }
			parentanchor = right
			position = { 4 0 }

			block "portrait"
			{
				vbox = {
					name = "righthand_portrait"
					margin_top = 2
					margin_right = -6

					portrait_head_small = {
						datacontext = "[Artifact.GetOwner]"
						name = "owner_portrait"
					}

					text_single = {
						text = "OWNER"
						align = left
					}
				}
			}
		}
	}

	type artifact_claim_ocr = vbox
	{
		# Requires
		# datacontext = Inventory
		# datacontext = InventorySlot

		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"
		using = tooltip_es


		widget_artifact_entry_ocr = {
			layoutpolicy_horizontal = expanding
			blockoverride "owner" {
				char_name = {
					layoutpolicy_horizontal = expanding
					datacontext = "[Artifact.GetOwner]"
					blockoverride "pre" {
						text_single = {
							raw_text = "Owner:"
						}
					}
					blockoverride "extra" {
						text_single = {
							raw_text = "[Character.GetMilitaryStrengthText] soldiers."
						}
					}
				}
			}
			blockoverride "claim" {}
			blockoverride "destroy" {
				visible = "[Artifact.GetOwner.IsLocalPlayer]"
			}
		}
	}

	type icon_artifact = icon {
		size = { 90 90 }

		block "tooltipwidget" {
			tooltipwidget = {
				artifact_tooltip = { }
			}
		}

		icon = {
			name = "rarity_icon"
			size = { 100% 100% }
			parentanchor = center
			alwaystransparent = yes
			texture = "gfx/interface/icons/artifact/artifact_bg.dds"
			frame = "[Artifact.GetIconFrame]"
			framesize = { 240 240 }
		}

		icon = {
			name = "unique_icon"
			visible = "[Artifact.IsUnique]"
			size = { 100% 100% }
			parentanchor = center
			alwaystransparent = yes
			texture = "gfx/interface/icons/artifact/artifact_unique.dds"
		}

		icon = {
			name = "artifact_icon"
			size = { 90% 90% }
			parentanchor = center

			texture = "[Artifact.GetIcon]"
			frame = "[Artifact.GetIconFrame]"
			framesize = { 240 240 }
		}
	}

	type button_artifact = button {
		size = { 90 90 }
		datacontext = "[AccessLocalPlayerCachedData.AccessNewArtifacts]"

		icon = {
			name = "rarity_icon"
			size = { 100% 100% }
			parentanchor = top
			alwaystransparent = yes

			texture = "gfx/interface/icons/artifact/artifact_bg.dds"
			frame = "[Artifact.GetIconFrame]"
			framesize = { 240 240 }
		}

		icon = {
			name = "unique_icon"
			visible = "[Artifact.IsUnique]"
			size = { 100% 100% }
			parentanchor = center
			alwaystransparent = yes
			texture = "gfx/interface/icons/artifact/artifact_unique.dds"
		}

		button = {
			name = "artifact_icon"
			size = { 90% 90% }
			parentanchor = center

			texture = "[Artifact.GetIcon]"
			frame = "[Artifact.GetIconFrame]"
			framesize = { 240 240 }

			block "on_click"
			{
				onclick = "[ToggleGameViewData( 'artifact_details', Artifact.GetID )]"
				onclick = "[LocalPlayerNewArtifacts.RemoveNewArtifact( Artifact.Self )]"
			}
		}

		tooltipwidget = {
			artifact_tooltip = { }
		}
	}
}
