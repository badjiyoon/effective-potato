function chromeTest(){

	//System.setProperty("webdriver.chrome.driver", "C:\\Users\\Snow\\Downloads\\chromedriver.exe");

	WebDriver driver = new ChromeDriver(); 

	//driver.get("http://seleniumhtml.appspot.com"); 

/*
driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS); //페이지를 다 읽어오고 나서 시작하기 위한 설정

JavascriptExecutor executor = (JavascriptExecutor)driver; //자바스크립트를 사용하기 위한 설정


driver.findElement(By.cssSelector(".name")).sendKeys("심해펭귄"); //sendKeys로 Input type="text"에 값을 넣어줍니다.

executor.executeScript("arguments[0].value=arguments[1]", driver.findElement(By.cssSelector(".address")), "Seoul");

//input type="text"가 아닌 hidden이나 readOnly  같이 직접 입력할 수 없는 것들은 자바스크립트를 이용해서 넣어 줄 수 있습니다.

driver.findElement(By.cssSelector("input[value=apple]")).click();   //해당 오브젝트를 클릭합니다.


driver.findElement(By.cssSelector("select")).click();

driver.findElement(By.cssSelector("select>option:nth-child(3)")).click();


//executor.executeScript("arguments[0].click", driver.findElement(By.cssSelector(".confirm-btn"))); //클릭 이벤트가 스크립트로 되어있다면 이런식으로 설정해야 작동하는 경우도 있습니다.

driver.findElement(By.cssSelector(".confirm-btn")).click();

driver.switchTo().alert().dismiss();    //confirm 이나 alert 창이 떴을 때 취소 버튼을 누릅니다.

//driver.switchTo().alert().accept();  //confirm 이나 alert 창이 떴을 때 확인 버튼을 누릅니다.​

 


driver.findElement(By.cssSelector(".submit-btn")).submit();   //form 오브젝트를 submit 합니다. 

 

  driver.quit();​ //종료합니다.
*/
} 
chromeTest();