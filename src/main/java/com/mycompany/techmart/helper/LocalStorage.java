package com.mycompany.techmart.helper;

import org.openqa.selenium.JavascriptExecutor;

public class LocalStorage {
    
    private JavascriptExecutor js;
    
    public void clearLocalStorage(){
    
        js.executeScript(String.format("sessionStorage.clear"));
    }
}
