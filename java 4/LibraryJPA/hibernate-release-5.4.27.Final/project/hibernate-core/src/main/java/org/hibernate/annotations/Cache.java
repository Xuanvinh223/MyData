/*
 * Hibernate, Relational Persistence for Idiomatic Java
 *
 * License: GNU Lesser General Public License (LGPL), version 2.1 or later.
 * See the lgpl.txt file in the root directory or <http://www.gnu.org/licenses/lgpl-2.1.html>.
 */
package org.hibernate.annotations;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

/**
 * Add caching strategy to a root entity or a collection.
 *
 * @author Emmanuel Bernard
 */
@Target({TYPE, METHOD, FIELD})
@Retention(RUNTIME)
public @interface Cache {
	/**
	 * The concurrency strategy chosen.
	 */
	CacheConcurrencyStrategy usage();

	/**
	 * The cache region name.
	 */
	String region() default "";

	/**
	 * How lazy properties are included in the second level cache. Default value is "all"; other allowable
	 * value: "non-lazy"
	 */
	String include() default "all";
}
