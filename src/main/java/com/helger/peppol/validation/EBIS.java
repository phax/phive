package com.helger.peppol.validation;

public enum EBIS
{
  BILLING (5),
  CATALOGUE (1),
  DESPATCH_ADVICE (30),
  INVOICE (4),
  MLR (36),
  ORDER (3),
  ORDERING (28);

  private final int m_nID;

  private EBIS (final int nID)
  {
    m_nID = nID;
  }

  public int getID ()
  {
    return m_nID;
  }
}
