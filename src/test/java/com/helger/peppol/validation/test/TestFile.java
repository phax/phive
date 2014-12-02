package com.helger.peppol.validation.test;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.IReadableResource;
import com.helger.peppol.validation.domain.TransactionKey;
import com.helger.ubl.EUBL21DocumentType;

@Immutable
public class TestFile
{
  private final IReadableResource m_aResource;
  private final TransactionKey m_aTransactionKey;

  public TestFile (@Nonnull final IReadableResource aResource, @Nonnull final TransactionKey aTransactionKey)
  {
    m_aResource = ValueEnforcer.notNull (aResource, "Resource");
    m_aTransactionKey = ValueEnforcer.notNull (aTransactionKey, "TransactionKey");
  }

  @Nonnull
  public IReadableResource getResource ()
  {
    return m_aResource;
  }

  @Nonnull
  public TransactionKey getTransactionKey ()
  {
    return m_aTransactionKey;
  }

  @Nonnull
  public EUBL21DocumentType getUBLDocumentType ()
  {
    return m_aTransactionKey.getTransaction ().getUBLDocumentType ();
  }
}
