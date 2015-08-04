package com.helger.peppol.validation.supplementary.createrules;

import java.util.Map;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;

import com.helger.commons.annotation.Nonempty;
import com.helger.commons.annotation.ReturnsMutableCopy;
import com.helger.commons.id.IHasID;
import com.helger.commons.lang.EnumHelper;
import com.helger.commons.url.SMap;
import com.helger.ubl21.CUBL21;

public enum ESyntaxBinding implements IHasID <String>
{
 UBL ("UBL")
 {
   @Override
   @Nonnull
   @ReturnsMutableCopy
   public Map <String, String> getAllNamespaces ()
   {
     return new SMap ().add ("cac", CUBL21.XML_SCHEMA_CAC_NAMESPACE_URL)
                       .add ("cbc", CUBL21.XML_SCHEMA_CBC_NAMESPACE_URL)
                       .add ("cec", CUBL21.XML_SCHEMA_CEC_NAMESPACE_URL);
   }
 },
 CEFACT ("CEFACT")
 {
   @Override
   @Nonnull
   @ReturnsMutableCopy
   public Map <String, String> getAllNamespaces ()
   {
     return new SMap ().add ("ram", "urn:un:unece:uncefact:data:standard:ReusableAggregateBusinessInformationEntity:10")
                       .add ("rsm", "urn:un:unece:uncefact:data:standard:CrossIndustryInvoice:4");
   }
 };

  private final String m_sID;

  private ESyntaxBinding (@Nonnull @Nonempty final String sID)
  {
    m_sID = sID;
  }

  @Nonnull
  @Nonempty
  public String getID ()
  {
    return m_sID;
  }

  /**
   * @return All namespaces as map from prefix to URL. Never <code>null</code>.
   */
  @Nonnull
  @ReturnsMutableCopy
  public abstract Map <String, String> getAllNamespaces ();

  @Nullable
  public static ESyntaxBinding getFromIDOrNull (@Nullable final String sID)
  {
    return EnumHelper.getFromIDOrNull (ESyntaxBinding.class, sID);
  }
}
