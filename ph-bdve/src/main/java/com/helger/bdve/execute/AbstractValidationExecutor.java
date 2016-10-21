package com.helger.bdve.execute;

import javax.annotation.Nonnull;
import javax.xml.transform.Source;
import javax.xml.transform.stream.StreamSource;

import com.helger.bdve.EValidationType;
import com.helger.bdve.ValidationKey;
import com.helger.commons.ValueEnforcer;
import com.helger.commons.io.stream.StreamHelper;
import com.helger.commons.string.ToStringGenerator;

/**
 * Abstract base implementation of {@link IValidationExecutor}.
 *
 * @author Philip Helger
 */
public abstract class AbstractValidationExecutor implements IValidationExecutor
{
  private final EValidationType m_eType;
  private final ValidationKey m_aVK;

  public AbstractValidationExecutor (@Nonnull final EValidationType eType, @Nonnull final ValidationKey aVK)
  {
    m_eType = ValueEnforcer.notNull (eType, "Type");
    m_aVK = ValueEnforcer.notNull (aVK, "ValidationKey");
  }

  @Nonnull
  public EValidationType getValidationType ()
  {
    return m_eType;
  }

  /**
   * @return The validation key passed in the constructor. Never
   *         <code>null</code>.
   */
  @Nonnull
  protected final ValidationKey getValidationKey ()
  {
    return m_aVK;
  }

  protected static void closeSource (@Nonnull final Source aSource)
  {
    if (aSource instanceof StreamSource)
    {
      // Close both because we don't know which one is used
      StreamHelper.close (((StreamSource) aSource).getInputStream ());
      StreamHelper.close (((StreamSource) aSource).getReader ());
    }
  }

  @Override
  public String toString ()
  {
    return new ToStringGenerator (this).append ("Type", m_eType).append ("ValidationKey", m_aVK).toString ();
  }
}
