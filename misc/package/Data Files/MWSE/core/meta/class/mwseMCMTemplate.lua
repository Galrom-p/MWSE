-- This file is autogenerated. Do not edit this file manually. Your changes will be ignored.
-- More information: https://github.com/MWSE/MWSE/tree/master/docs

--- @meta
--- A Template is the top level component in MCM. It determines the overall layout of the menu. Can be created with a table or a string (name).
--- @class mwseMCMTemplate : mwseMCMComponent
--- @field componentType "Template" The type of this component.
--- @field currentPage mwseMCMExclusionsPage|mwseMCMFilterPage|mwseMCMMouseOverPage|mwseMCMPage|mwseMCMSideBarPage The currently displayed page in this Template.
--- @field elements mwseMCMTemplateElements This dictionary-style table holds all the UI elements of the Template, for easy access.
--- @field headerImagePath string|nil The path to the header image. It's relative to `Data Files/`. The image must have power-of-2 dimensions (i.e. 16, 32, 64, 128, 256, 512, 1024, etc.).
--- @field name string The name field is the mod name, used to register the MCM, and is displayed in the mod list on the lefthand pane.
--- @field onClose nil|fun(modConfigContainer: tes3uiElement) A function which will be called when the menu is closed. Useful for saving variables, such as TableVariable.
--- @field onSearch nil|fun(searchText: string): boolean A custom search handler function. This function should return true if this mod Template should show up in search results for given `searchText`.
--- @field pages mwseMCMExclusionsPage[]|mwseMCMFilterPage[]|mwseMCMMouseOverPage[]|mwseMCMPage[]|mwseMCMSideBarPage[] Pages in this Template.
mwseMCMTemplate = {}

--- Destroys the currently display page and creates the given page as the new current page.
--- @param thisPage mwseMCMExclusionsPage|mwseMCMFilterPage|mwseMCMMouseOverPage|mwseMCMPage|mwseMCMSideBarPage No description yet available.
function mwseMCMTemplate:clickTab(thisPage) end

--- This method creates the UI elements specific to a Template.
--- @param parentBlock tes3uiElement No description yet available.
function mwseMCMTemplate:createContentsContainer(parentBlock) end

--- Creates a new Exclusions Page in this Template.
--- @param data mwseMCMTemplate.createExclusionsPage.data This table accepts the following values:
--- 
--- `showHeader`: boolean? — *Default*: `false`. The page's label will only be created if set to true.
--- 
--- `label`: string — The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- 
--- `variable`: mwseMCMConfigVariable|mwseMCMCustomVariable|mwseMCMGlobal|mwseMCMGlobalBoolean|mwseMCMPlayerData|mwseMCMTableVariable|mwseMCMVariable|mwseMCMSettingNewVariable — The Variable used to store blocked list entries.
--- 
--- `filters`: mwseMCMExclusionsPageFilter[] — A list of filters. Filters control which items will appear in the lists of the Exclusions Page. At least one filter is required. See the [filter page](./mwseMCMExclusionsPageFilter.md) for description.
--- 
--- `description`: string? — *Optional*. Displayed at the top of the page above the lists.
--- 
--- `toggleText`: string? — *Optional*. The text for the button that toggles filtered items from one list to another. The default is a localised version of "Toggle Filtered".
--- 
--- `leftListLabel `: string? — *Optional*. The label on the left list. The default is a localised version of "Blocked".
--- 
--- `rightListLabel `: string? — *Optional*. The label on the right list. The default is a localised version of "Allowed".
--- 
--- `showAllBlocked `: boolean? — *Default*: `false`. When set to true, the left list shows all items in the blocked table, regardless of the filter being used.
--- 
--- `indent`: integer? — *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- 
--- `childIndent`: integer? — *Optional*. The left padding size in pixels. Used on all the child components.
--- 
--- `paddingBottom`: integer? — *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- 
--- `childSpacing`: integer? — *Optional*. The bottom border size in pixels. Used on all the child components.
--- 
--- `inGameOnly`: boolean? — *Default*: `false`. No description yet available.
--- @return mwseMCMExclusionsPage page No description yet available.
function mwseMCMTemplate:createExclusionsPage(data) end

---Table parameter definitions for `mwseMCMTemplate.createExclusionsPage`.
--- @class mwseMCMTemplate.createExclusionsPage.data
--- @field showHeader boolean? *Default*: `false`. The page's label will only be created if set to true.
--- @field label string The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- @field variable mwseMCMConfigVariable|mwseMCMCustomVariable|mwseMCMGlobal|mwseMCMGlobalBoolean|mwseMCMPlayerData|mwseMCMTableVariable|mwseMCMVariable|mwseMCMSettingNewVariable The Variable used to store blocked list entries.
--- @field filters mwseMCMExclusionsPageFilter[] A list of filters. Filters control which items will appear in the lists of the Exclusions Page. At least one filter is required. See the [filter page](./mwseMCMExclusionsPageFilter.md) for description.
--- @field description string? *Optional*. Displayed at the top of the page above the lists.
--- @field toggleText string? *Optional*. The text for the button that toggles filtered items from one list to another. The default is a localised version of "Toggle Filtered".
--- @field leftListLabel  string? *Optional*. The label on the left list. The default is a localised version of "Blocked".
--- @field rightListLabel  string? *Optional*. The label on the right list. The default is a localised version of "Allowed".
--- @field showAllBlocked  boolean? *Default*: `false`. When set to true, the left list shows all items in the blocked table, regardless of the filter being used.
--- @field indent integer? *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- @field childIndent integer? *Optional*. The left padding size in pixels. Used on all the child components.
--- @field paddingBottom integer? *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- @field childSpacing integer? *Optional*. The bottom border size in pixels. Used on all the child components.
--- @field inGameOnly boolean? *Default*: `false`. No description yet available.

--- Creates a new Filter Page in this Template.
--- @param data string|mwseMCMTemplate.createFilterPage.data|nil This table accepts the following values:
--- 
--- `showHeader`: boolean? — *Default*: `false`. The page's label will only be created if set to true.
--- 
--- `label`: string? — *Optional*. The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- 
--- `noScroll`: boolean? — *Default*: `false`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- 
--- `description`: string? — *Optional*. Default sidebar text shown when the mouse isn't hovering over a component inside this Sidebar Page. It will be added to right column as a mwseMCMInfo.
--- 
--- `placeholderSearchText`: string? — *Default*: `Search...`. The text shown in the search bar when no text is entered.
--- 
--- `components`: mwseMCMComponent.getComponent.componentData[]? — *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMFilterPage.md#getcomponent).
--- 
--- `indent`: integer? — *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- 
--- `childIndent`: integer? — *Optional*. The left padding size in pixels. Used on all the child components.
--- 
--- `paddingBottom`: integer? — *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- 
--- `childSpacing`: integer? — *Optional*. The bottom border size in pixels. Used on all the child components.
--- 
--- `inGameOnly`: boolean? — *Default*: `false`. No description yet available.
--- 
--- `postCreate`: nil|fun(self: mwseMCMFilterPage) — *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.
--- @return mwseMCMFilterPage page No description yet available.
function mwseMCMTemplate:createFilterPage(data) end

---Table parameter definitions for `mwseMCMTemplate.createFilterPage`.
--- @class mwseMCMTemplate.createFilterPage.data
--- @field showHeader boolean? *Default*: `false`. The page's label will only be created if set to true.
--- @field label string? *Optional*. The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- @field noScroll boolean? *Default*: `false`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- @field description string? *Optional*. Default sidebar text shown when the mouse isn't hovering over a component inside this Sidebar Page. It will be added to right column as a mwseMCMInfo.
--- @field placeholderSearchText string? *Default*: `Search...`. The text shown in the search bar when no text is entered.
--- @field components mwseMCMComponent.getComponent.componentData[]? *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMFilterPage.md#getcomponent).
--- @field indent integer? *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- @field childIndent integer? *Optional*. The left padding size in pixels. Used on all the child components.
--- @field paddingBottom integer? *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- @field childSpacing integer? *Optional*. The bottom border size in pixels. Used on all the child components.
--- @field inGameOnly boolean? *Default*: `false`. No description yet available.
--- @field postCreate nil|fun(self: mwseMCMFilterPage) *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.

--- If a Template has headerImagePath defined, this method creates an image UI element from image at given path. If not, creates a label UI block with `self.label` text.
--- @param parentBlock tes3uiElement No description yet available.
function mwseMCMTemplate:createLabel(parentBlock) end

--- Creates a new MouseOverPage in this Template.
--- @param data mwseMCMTemplate.createMouseOverPage.data? This table accepts the following values:
--- 
--- `showHeader`: boolean? — *Default*: `false`. The page's label will only be created if set to true.
--- 
--- `label`: string? — *Optional*. The page label.
--- 
--- `noScroll`: boolean? — *Default*: `true`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- 
--- `components`: mwseMCMComponent.getComponent.componentData[]? — *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMPage.md#getcomponent).
--- 
--- `indent`: integer? — *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- 
--- `childIndent`: integer? — *Optional*. The left padding size in pixels. Used on all the child components.
--- 
--- `paddingBottom`: integer? — *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- 
--- `childSpacing`: integer? — *Optional*. The bottom border size in pixels. Used on all the child components.
--- 
--- `inGameOnly`: boolean? — *Default*: `false`. No description yet available.
--- 
--- `postCreate`: nil|fun(self: mwseMCMMouseOverPage) — *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.
--- @return mwseMCMMouseOverPage page No description yet available.
function mwseMCMTemplate:createMouseOverPage(data) end

---Table parameter definitions for `mwseMCMTemplate.createMouseOverPage`.
--- @class mwseMCMTemplate.createMouseOverPage.data
--- @field showHeader boolean? *Default*: `false`. The page's label will only be created if set to true.
--- @field label string? *Optional*. The page label.
--- @field noScroll boolean? *Default*: `true`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- @field components mwseMCMComponent.getComponent.componentData[]? *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMPage.md#getcomponent).
--- @field indent integer? *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- @field childIndent integer? *Optional*. The left padding size in pixels. Used on all the child components.
--- @field paddingBottom integer? *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- @field childSpacing integer? *Optional*. The bottom border size in pixels. Used on all the child components.
--- @field inGameOnly boolean? *Default*: `false`. No description yet available.
--- @field postCreate nil|fun(self: mwseMCMMouseOverPage) *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.

--- Creates a new Page in this Template.
--- @param data string|mwseMCMTemplate.createPage.data|nil This table accepts the following values:
--- 
--- `showHeader`: boolean? — *Default*: `false`. The page's label will only be created if set to true.
--- 
--- `label`: string? — *Optional*. The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- 
--- `noScroll`: boolean? — *Default*: `false`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- 
--- `components`: mwseMCMComponent.getComponent.componentData[]? — *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMPage.md#getcomponent).
--- 
--- `indent`: integer? — *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- 
--- `childIndent`: integer? — *Optional*. The left padding size in pixels. Used on all the child components.
--- 
--- `paddingBottom`: integer? — *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- 
--- `childSpacing`: integer? — *Optional*. The bottom border size in pixels. Used on all the child components.
--- 
--- `inGameOnly`: boolean? — *Default*: `false`. No description yet available.
--- 
--- `postCreate`: nil|fun(self: mwseMCMPage) — *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.
--- @return mwseMCMExclusionsPage|mwseMCMFilterPage|mwseMCMMouseOverPage|mwseMCMPage|mwseMCMSideBarPage page No description yet available.
function mwseMCMTemplate:createPage(data) end

---Table parameter definitions for `mwseMCMTemplate.createPage`.
--- @class mwseMCMTemplate.createPage.data
--- @field showHeader boolean? *Default*: `false`. The page's label will only be created if set to true.
--- @field label string? *Optional*. The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- @field noScroll boolean? *Default*: `false`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- @field components mwseMCMComponent.getComponent.componentData[]? *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMPage.md#getcomponent).
--- @field indent integer? *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- @field childIndent integer? *Optional*. The left padding size in pixels. Used on all the child components.
--- @field paddingBottom integer? *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- @field childSpacing integer? *Optional*. The bottom border size in pixels. Used on all the child components.
--- @field inGameOnly boolean? *Default*: `false`. No description yet available.
--- @field postCreate nil|fun(self: mwseMCMPage) *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.

--- Creates a new Sidebar Page in this Template.
--- @param data string|mwseMCMTemplate.createSideBarPage.data|nil This table accepts the following values:
--- 
--- `showHeader`: boolean? — *Default*: `false`. The page's label will only be created if set to true.
--- 
--- `label`: string? — *Optional*. The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- 
--- `noScroll`: boolean? — *Default*: `false`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- 
--- `description`: string? — *Optional*. Default sidebar text shown when the mouse isn't hovering over a component inside this Sidebar Page. It will be added to right column as a mwseMCMInfo.
--- 
--- `components`: mwseMCMComponent.getComponent.componentData[]? — *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMSideBarPage.md#getcomponent).
--- 
--- `indent`: integer? — *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- 
--- `childIndent`: integer? — *Optional*. The left padding size in pixels. Used on all the child components.
--- 
--- `paddingBottom`: integer? — *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- 
--- `childSpacing`: integer? — *Optional*. The bottom border size in pixels. Used on all the child components.
--- 
--- `inGameOnly`: boolean? — *Default*: `false`. No description yet available.
--- 
--- `postCreate`: nil|fun(self: mwseMCMSideBarPage) — *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.
--- @return mwseMCMFilterPage|mwseMCMSideBarPage page No description yet available.
function mwseMCMTemplate:createSideBarPage(data) end

---Table parameter definitions for `mwseMCMTemplate.createSideBarPage`.
--- @class mwseMCMTemplate.createSideBarPage.data
--- @field showHeader boolean? *Default*: `false`. The page's label will only be created if set to true.
--- @field label string? *Optional*. The label field is displayed in the tab for that page at the top of the menu. Defaults to: "Page {number}".
--- @field noScroll boolean? *Default*: `false`. When set to true, the page will not have a scrollbar. Particularly useful if you want to use a [ParagraphField](./mwseMCMParagraphField.md), which is not compatible with scroll panes.
--- @field description string? *Optional*. Default sidebar text shown when the mouse isn't hovering over a component inside this Sidebar Page. It will be added to right column as a mwseMCMInfo.
--- @field components mwseMCMComponent.getComponent.componentData[]? *Optional*. Use this if you want to directly create all the nested components in this Page. This table is described at [getComponent](./mwseMCMSideBarPage.md#getcomponent).
--- @field indent integer? *Default*: `6`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- @field childIndent integer? *Optional*. The left padding size in pixels. Used on all the child components.
--- @field paddingBottom integer? *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- @field childSpacing integer? *Optional*. The bottom border size in pixels. Used on all the child components.
--- @field inGameOnly boolean? *Default*: `false`. No description yet available.
--- @field postCreate nil|fun(self: mwseMCMSideBarPage) *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.

--- This method creates the pageBlock UI element and the first page of the Template.
--- @param parentBlock tes3uiElement No description yet available.
function mwseMCMTemplate:createSubcomponentsContainer(parentBlock) end

--- This method creates a button for given page in the tabsBlock UI elements of the Template. The button has an event handler registered on tes3.uiEvent.mouseClick that calls `self:clickTab(page)`.
--- @param page mwseMCMExclusionsPage|mwseMCMFilterPage|mwseMCMMouseOverPage|mwseMCMPage|mwseMCMSideBarPage No description yet available.
function mwseMCMTemplate:createTab(page) end

--- This method creates the outerTabsBlock, previousTabButton, tabsBlock and nextTabButton UI elements of the Template. The page tabs aren't created if the Template contains only one page.
--- @param parentBlock tes3uiElement No description yet available.
function mwseMCMTemplate:createTabsBlock(parentBlock) end

--- Creates a new Template.
--- @param data mwseMCMTemplate.new.data This table accepts the following values:
--- 
--- `name`: string? — *Optional*. The name field is the mod name, used to register the MCM, and is displayed in the mod list on the lefthand pane.
--- 
--- `label`: string? — *Optional*. Used in place of `name` if that argument isn't passed. You need to pass at least one of the `name` and `label` arguments. If `headerImagePath` is not passed, a UI element will be created with `label` as text.
--- 
--- `headerImagePath`: string? — *Optional*. Set it to display an image at the top of your menu. Path is relative to `Data Files/`. The image must have power-of-2 dimensions (i.e. 16, 32, 64, 128, 256, 512, 1024, etc.).
--- 
--- `onClose`: nil|fun(modConfigContainer: tes3uiElement) — *Optional*. Set this to a function which will be called when the menu is closed. Useful for saving variables, such as TableVariable.
--- 
--- `onSearch`: nil|fun(searchText: string): boolean — *Optional*. A custom search handler function. This function should return true if this mod Template should show up in search results for given `searchText`.
--- 
--- `pages`: mwseMCMPage.new.data[]? — *Optional*. You can create pages for the template directly here. The entries in the array must specify the class of the page.
--- 
--- `indent`: integer? — *Default*: `12`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- 
--- `childIndent`: integer? — *Optional*. The left padding size in pixels. Used on all the child components.
--- 
--- `paddingBottom`: integer? — *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- 
--- `childSpacing`: integer? — *Optional*. The bottom border size in pixels. Used on all the child components.
--- 
--- `inGameOnly`: boolean? — *Default*: `false`. No description yet available.
--- 
--- `postCreate`: nil|fun(self: mwseMCMTemplate) — *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.
--- 
--- `class`: string? — *Optional*. No description yet available.
--- 
--- `parentComponent`: mwseMCMActiveInfo|mwseMCMButton|mwseMCMCategory|mwseMCMComponent|mwseMCMCycleButton|mwseMCMDecimalSlider|mwseMCMDropdown|mwseMCMExclusionsPage|mwseMCMFilterPage|mwseMCMHyperlink|mwseMCMInfo|mwseMCMKeyBinder|mwseMCMMouseOverInfo|mwseMCMMouseOverPage|mwseMCMOnOffButton|mwseMCMPage|mwseMCMParagraphField|mwseMCMSetting|mwseMCMSideBarPage|mwseMCMSideBySideBlock|mwseMCMSlider|mwseMCMTemplate|mwseMCMTextField|mwseMCMYesNoButton|nil — *Optional*. No description yet available.
--- @return mwseMCMTemplate template No description yet available.
function mwseMCMTemplate:new(data) end

---Table parameter definitions for `mwseMCMTemplate.new`.
--- @class mwseMCMTemplate.new.data
--- @field name string? *Optional*. The name field is the mod name, used to register the MCM, and is displayed in the mod list on the lefthand pane.
--- @field label string? *Optional*. Used in place of `name` if that argument isn't passed. You need to pass at least one of the `name` and `label` arguments. If `headerImagePath` is not passed, a UI element will be created with `label` as text.
--- @field headerImagePath string? *Optional*. Set it to display an image at the top of your menu. Path is relative to `Data Files/`. The image must have power-of-2 dimensions (i.e. 16, 32, 64, 128, 256, 512, 1024, etc.).
--- @field onClose nil|fun(modConfigContainer: tes3uiElement) *Optional*. Set this to a function which will be called when the menu is closed. Useful for saving variables, such as TableVariable.
--- @field onSearch nil|fun(searchText: string): boolean *Optional*. A custom search handler function. This function should return true if this mod Template should show up in search results for given `searchText`.
--- @field pages mwseMCMPage.new.data[]? *Optional*. You can create pages for the template directly here. The entries in the array must specify the class of the page.
--- @field indent integer? *Default*: `12`. The left padding size in pixels. Only used if the `childIndent` isn't set on the parent component.
--- @field childIndent integer? *Optional*. The left padding size in pixels. Used on all the child components.
--- @field paddingBottom integer? *Default*: `4`. The bottom border size in pixels. Only used if the `childSpacing` is unset on the parent component.
--- @field childSpacing integer? *Optional*. The bottom border size in pixels. Used on all the child components.
--- @field inGameOnly boolean? *Default*: `false`. No description yet available.
--- @field postCreate nil|fun(self: mwseMCMTemplate) *Optional*. Can define a custom formatting function to make adjustments to any element saved in `self.elements`.
--- @field class string? *Optional*. No description yet available.
--- @field parentComponent mwseMCMActiveInfo|mwseMCMButton|mwseMCMCategory|mwseMCMComponent|mwseMCMCycleButton|mwseMCMDecimalSlider|mwseMCMDropdown|mwseMCMExclusionsPage|mwseMCMFilterPage|mwseMCMHyperlink|mwseMCMInfo|mwseMCMKeyBinder|mwseMCMMouseOverInfo|mwseMCMMouseOverPage|mwseMCMOnOffButton|mwseMCMPage|mwseMCMParagraphField|mwseMCMSetting|mwseMCMSideBarPage|mwseMCMSideBySideBlock|mwseMCMSlider|mwseMCMTemplate|mwseMCMTextField|mwseMCMYesNoButton|nil *Optional*. No description yet available.

--- This method calls the `onSearch` handler if it exists.
--- @param searchText string No description yet available.
--- @return boolean result No description yet available.
function mwseMCMTemplate:onSearchInternal(searchText) end

--- A convenience function that registers the mod's configuration menu using its Template.
--- 
--- You don't need to call `mwse.registerModConfig` or `mwse.mcm.register` if calling this function.
function mwseMCMTemplate:register() end

--- This method assigns a new function to `onClose` field that calls `mwse.saveConfig` with given parameters.
--- @param fileName string No description yet available.
--- @param config unknown No description yet available.
function mwseMCMTemplate:saveOnClose(fileName, config) end

--- This method assigns a custom search handler for the Template. This function should return true if this mod should show up in search results for given `searchText`.
--- @param callback nil|fun(searchText: string): boolean No description yet available.
function mwseMCMTemplate:setCustomSearchHandler(callback) end

