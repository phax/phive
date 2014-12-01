package com.helger.peppol.validation.test;

import javax.annotation.Nonnull;
import javax.annotation.concurrent.Immutable;

import com.helger.commons.io.resource.ClassPathResource;
import com.helger.peppol.validation.domain.TransactionKey;

@Immutable
public class StandardTestFile extends TestFile
{
  public StandardTestFile (@Nonnull final String sPath, @Nonnull final TransactionKey aTransactionKey)
  {
    super (new ClassPathResource ("/standard/" + sPath), aTransactionKey);
  }
}
