from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains

class UtilityExtLib:

	ROBOT_LIBRARY_SCOPE = 'GLOBAL'

	def press_tab_key_without_locator(self):
		""" Clicks the tab key with no locator """
		actions = self._getActionChains()
		actions.send_keys(Keys.TAB).perform()
		
	def _getActionChains(self):
		""" Helper function to get the browser ActionChains """
		seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
		driver = seleniumlib._current_browser()
		return ActionChains(driver)
