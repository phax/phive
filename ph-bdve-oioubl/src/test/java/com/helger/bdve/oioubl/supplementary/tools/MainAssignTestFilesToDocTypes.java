package com.helger.bdve.oioubl.supplementary.tools;

import java.io.File;
import java.util.Map;

import com.helger.commons.collection.impl.CommonsTreeMap;
import com.helger.commons.collection.impl.ICommonsMap;
import com.helger.commons.compare.IComparator;
import com.helger.commons.io.file.FileSystemRecursiveIterator;

public class MainAssignTestFilesToDocTypes
{
  public static void main (final String [] args)
  {
    final ICommonsMap <String, String> aMap = new CommonsTreeMap <> (IComparator.getComparatorStringLongestFirst (false));
    aMap.put ("ApplicationResponse", "APPLICATION_RESPONSE");
    aMap.put ("Catalogue", "CATALOGUE");
    aMap.put ("CatalogueDeletion", "CATALOGUE_DELETION");
    aMap.put ("CatalogueItemSpecificationUpdate", "CATALOGUE_ITEM_SPECIFICATION_UPDATE");
    aMap.put ("CataloguePricingUpdate", "CATALOGUE_PRICING_UPDATE");
    aMap.put ("CatalogueRequest", "CATALOGUE_REQUEST");
    aMap.put ("CreditNote", "CREDIT_NOTE");
    aMap.put ("Invoice", "INVOICE");
    aMap.put ("Order", "ORDER");
    aMap.put ("OrderCancellation", "ORDER_CANCELLATION");
    aMap.put ("OrderChange", "ORDER_CHANGE");
    aMap.put ("OrderResponse", "ORDER_RESPONSE");
    aMap.put ("OrderResponseSimple", "ORDER_RESPONSE_SIMPLE");
    aMap.put ("Reminder", "REMINDER");
    aMap.put ("Statement", "STATEMENT");
    if (false)
      aMap.put ("UtilityStatement", "UTILITY_STATEMENT");

    for (final File f : new FileSystemRecursiveIterator (new File ("src/test/resources/oioubl/2.0.2")))
    {
      if (false)
        System.out.println (f.getName ());

      String sBestMatch = null;
      for (final Map.Entry <String, String> e : aMap.entrySet ())
        if (f.getName ().contains (e.getKey ()))
        {
          sBestMatch = e.getValue ();
          break;
        }

      if (sBestMatch == null)
      {
        System.err.println ("  No match found: " + f.getName ());
        continue;
      }

      System.out.println ("aMap.putSingle (OIOUBLValidation.VID_OIOUBL_" +
                          sBestMatch +
                          ", new ClassPathResource (\"/oioubl/2.0.2/" +
                          f.getName () +
                          "\"));");
    }
  }
}
