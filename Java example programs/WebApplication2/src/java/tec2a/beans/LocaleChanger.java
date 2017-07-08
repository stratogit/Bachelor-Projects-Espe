/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tec2a.beans;

import java.util.Locale;
import javax.faces.context.FacesContext;

/**
 *
 * @author Java
 */
public class LocaleChanger {

    /** Creates a new instance of LocaleChanger */
    public LocaleChanger() {

    }
    public String englishAction(){
        FacesContext context=FacesContext.getCurrentInstance();
        context.getViewRoot().setLocale(Locale.ENGLISH);
        return null;

    }
     public String spanishAction(){
         FacesContext context=FacesContext.getCurrentInstance();
         Locale local1=new Locale("ES");
         context.getViewRoot().setLocale(local1);
          return null;
    }
}
