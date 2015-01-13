// default package
// Generated 2010-2-22 17:34:53 by Hibernate Tools 3.2.4.GA


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * SsResource generated by hbm2java
 */
@Entity
@Table(name="ss_resource"
    ,catalog="yuqiapp_java"
    , uniqueConstraints = @UniqueConstraint(columnNames="value") 
)
public class SsResource  implements java.io.Serializable {


     private Long id;
     private double position;
     private String resourceType;
     private String value;
     private Set<SsResourceAuthority> ssResourceAuthorities = new HashSet<SsResourceAuthority>(0);

    public SsResource() {
    }

	
    public SsResource(double position, String resourceType, String value) {
        this.position = position;
        this.resourceType = resourceType;
        this.value = value;
    }
    public SsResource(double position, String resourceType, String value, Set<SsResourceAuthority> ssResourceAuthorities) {
       this.position = position;
       this.resourceType = resourceType;
       this.value = value;
       this.ssResourceAuthorities = ssResourceAuthorities;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    
    @Column(name="position", nullable=false, precision=22, scale=0)
    public double getPosition() {
        return this.position;
    }
    
    public void setPosition(double position) {
        this.position = position;
    }

    
    @Column(name="resource_type", nullable=false)
    public String getResourceType() {
        return this.resourceType;
    }
    
    public void setResourceType(String resourceType) {
        this.resourceType = resourceType;
    }

    
    @Column(name="value", unique=true, nullable=false)
    public String getValue() {
        return this.value;
    }
    
    public void setValue(String value) {
        this.value = value;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="ssResource")
    public Set<SsResourceAuthority> getSsResourceAuthorities() {
        return this.ssResourceAuthorities;
    }
    
    public void setSsResourceAuthorities(Set<SsResourceAuthority> ssResourceAuthorities) {
        this.ssResourceAuthorities = ssResourceAuthorities;
    }




}

