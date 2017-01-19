package com.helger.bdve.source;

import java.io.Serializable;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.xml.transform.Source;

import org.w3c.dom.Node;

import com.helger.xml.transform.TransformSourceFactory;

/**
 * Abstract validation source.
 *
 * @author Philip Helger
 */
public interface IValidationSource extends Serializable
{
  /**
   * @return The system ID (e.g. filename) of the source to be validated. May be
   *         <code>null</code>.
   */
  @Nullable
  String getSystemID ();

  /**
   * @return The source node to be validated. May be <code>null</code>.
   */
  @Nullable
  Node getNode ();

  /**
   * @return This validation source as a `javax.xml.transform.Source`. Never
   *         <code>null</code>.
   * @throws IllegalStateException
   *         If no transform source object can be created.
   */
  @Nonnull
  default Source getAsTransformSource ()
  {
    Source ret = null;
    final Node aNode = getNode ();
    if (aNode != null)
      ret = TransformSourceFactory.create (aNode);
    if (ret == null)
      throw new IllegalStateException ("No valid input object is present!");

    ret.setSystemId (getSystemID ());
    return ret;
  }
}
