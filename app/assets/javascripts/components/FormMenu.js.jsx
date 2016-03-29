class FormMenu extends React.Component {
    constructor(props){
        super(props);

    }

    clicked(index){
        this.props.onIndexChange(index);
    }

    render(){
        return (
          <div>
            <ul className="material-tabs nav nav-tabs" role="tablist">
                { this.props.items.map( (item, index) => {
                    var style = '';
                    if(index == this.props.clicked){
                        style = 'active';
                    }
                    return <li role="presentation"
                               key={index}
                               className={style} >
                                 <a href="#"
                                    onClick={ this.clicked.bind(this, index) }
                                    role="tab">
                                   {item}
                                 </a>
                           </li>;
                })}
            </ul>

          </div>
        );
    }
}